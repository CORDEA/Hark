// Package fcm delivers high-priority push notifications. The wire payload is
// primarily data-only (the mobile client renders UI from its own strings),
// but a localized title/body is included so the OS shelf has text for the
// (rare) case where the app can't process the data payload in-process.
package fcm

import (
	"context"
	"errors"
	"io/fs"
	"log/slog"
	"os"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/messaging"
	"golang.org/x/oauth2/google"
	"google.golang.org/api/option"
)

// Kind names the data payload for the mobile client to switch on.
const (
	KindAlert   = "alert"
	KindResolve = "resolve"
	KindTest    = "test"
)

// Android notification channel IDs. The mobile client registers these on
// launch; the backend stamps the matching id so the OS routes each push to
// the channel with the right importance/sound.
const (
	AndroidChannelWarning  = "hark_alert_warning"
	AndroidChannelCritical = "hark_alert_critical"
)

// Message is our thin wrapper over the FCM data model. The client renders
// in-app UI solely from Data; Title/Body populate the OS notification shelf
// as a fallback. Both are already localized to the target device's locale by
// the caller (usually via services/i18n) before Send is invoked.
type Message struct {
	Token   string            // per-device
	Data    map[string]string // required (contextless payload)
	AlertID string            // used for collapse-id/tag
	Kind    string            // KindAlert / KindResolve / KindTest
	// Critical flag decides interruption-level + collapse behavior.
	Critical bool
	// Title/Body are pre-localized notification strings. Leaving them empty
	// keeps the legacy data-only behavior for backwards compatibility.
	Title string
	Body  string
}

// SendResult tells callers which tokens are dead so they can be deleted.
type SendResult struct {
	Success    int
	Failure    int
	DeadTokens []string
}

type Sender interface {
	Send(ctx context.Context, msgs []Message) SendResult
}

// New returns a Sender using the first credential source available, in order:
//
//  1. Application Default Credentials — resolves Workload Identity Federation
//     external accounts, GCE/GKE metadata server, `gcloud auth
//     application-default login`, and any file pointed at by
//     GOOGLE_APPLICATION_CREDENTIALS. Preferred: WIF avoids shipping a
//     long-lived service-account key.
//  2. The service-account JSON at credentialsPath (typically FCM_CREDENTIALS).
//  3. A no-op sender that logs payloads — kept so the container image can
//     start cleanly before the operator drops in either credential source.
func New(ctx context.Context, credentialsPath string) (Sender, error) {
	if _, err := google.FindDefaultCredentials(ctx); err == nil {
		slog.Info("fcm: using Application Default Credentials")
		return newFirebaseSender(ctx)
	}

	if credentialsPath == "" {
		slog.Warn("fcm: no ADC and FCM_CREDENTIALS is empty — using no-op sender (payloads will be logged)")
		return &noopSender{}, nil
	}
	if _, err := os.Stat(credentialsPath); err != nil {
		if errors.Is(err, fs.ErrNotExist) {
			slog.Warn("fcm: no ADC and credentials file not found — using no-op sender",
				"path", credentialsPath)
			return &noopSender{}, nil
		}
		return nil, err
	}
	slog.Info("fcm: using service-account credentials file", "path", credentialsPath)
	return newFirebaseSender(ctx, option.WithCredentialsFile(credentialsPath))
}

func newFirebaseSender(ctx context.Context, opts ...option.ClientOption) (Sender, error) {
	app, err := firebase.NewApp(ctx, nil, opts...)
	if err != nil {
		slog.Warn("fcm: firebase init failed — using no-op sender", "err", err)
		return &noopSender{}, nil
	}
	client, err := app.Messaging(ctx)
	if err != nil {
		slog.Warn("fcm: messaging client init failed — using no-op sender", "err", err)
		return &noopSender{}, nil
	}
	return &firebaseSender{client: client}, nil
}

type firebaseSender struct {
	client *messaging.Client
}

func (s *firebaseSender) Send(ctx context.Context, msgs []Message) SendResult {
	var res SendResult
	for _, m := range msgs {
		fm := buildFirebaseMessage(m)
		_, err := s.client.Send(ctx, fm)
		if err != nil {
			res.Failure++
			if isDeadToken(err) {
				res.DeadTokens = append(res.DeadTokens, m.Token)
			}
			slog.Warn("fcm send", "err", err, "kind", m.Kind, "alert_id", m.AlertID)
			continue
		}
		res.Success++
	}
	return res
}

func buildFirebaseMessage(m Message) *messaging.Message {
	fm := &messaging.Message{
		Token: m.Token,
		Data:  m.Data,
		Android: &messaging.AndroidConfig{
			Priority:    "high",
			CollapseKey: m.AlertID,
		},
		APNS: &messaging.APNSConfig{
			Headers: map[string]string{
				"apns-priority": "10",
			},
			Payload: &messaging.APNSPayload{
				Aps: &messaging.Aps{ContentAvailable: true},
			},
		},
	}
	if m.Title != "" || m.Body != "" {
		fm.Notification = &messaging.Notification{Title: m.Title, Body: m.Body}
		fm.Android.Notification = &messaging.AndroidNotification{
			Priority: messaging.PriorityMax,
		}
		fm.APNS.Payload.Aps.Alert = &messaging.ApsAlert{
			Title: m.Title,
			Body:  m.Body,
		}
	}
	if m.Kind == KindAlert {
		if fm.Android.Notification == nil {
			fm.Android.Notification = &messaging.AndroidNotification{
				Priority: messaging.PriorityMax,
			}
		}
		fm.Android.Notification.ChannelID = AndroidChannelWarning
		if m.Critical {
			fm.Android.Notification.ChannelID = AndroidChannelCritical
		}
	}
	if m.AlertID != "" {
		fm.APNS.Headers["apns-collapse-id"] = m.AlertID
	}
	if m.Kind == KindAlert && m.Critical {
		fm.APNS.Payload.Aps.CriticalSound = &messaging.CriticalSound{
			Critical: true,
			Name:     "alarm.caf",
			Volume:   1.0,
		}
	}
	return fm
}

func isDeadToken(err error) bool {
	if err == nil {
		return false
	}
	return messaging.IsRegistrationTokenNotRegistered(err) ||
		messaging.IsUnregistered(err) ||
		messaging.IsInvalidArgument(err)
}

// noopSender logs payloads. It never reports dead tokens.
type noopSender struct{}

func (n *noopSender) Send(_ context.Context, msgs []Message) SendResult {
	for _, m := range msgs {
		slog.Info("fcm noop send", "token", truncate(m.Token, 12), "kind", m.Kind, "alert_id", m.AlertID, "data", m.Data)
	}
	return SendResult{Success: len(msgs)}
}

func truncate(s string, n int) string {
	if len(s) <= n {
		return s
	}
	return s[:n] + "…"
}
