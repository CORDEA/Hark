// Package fcm delivers data-only, high-priority push notifications.
package fcm

import (
	"context"
	"log/slog"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/messaging"
	"google.golang.org/api/option"
)

// Kind names the data payload for the mobile client to switch on.
const (
	KindAlert   = "alert"
	KindResolve = "resolve"
	KindTest    = "test"
)

// Message is our thin wrapper over the FCM data model. The client renders UI
// solely from these fields — no notification/body strings are sent.
type Message struct {
	Token   string            // per-device
	Data    map[string]string // required (contextless payload)
	AlertID string            // used for collapse-id/tag
	Kind    string            // KindAlert / KindResolve / KindTest
	// Critical flag decides interruption-level + collapse behavior.
	Critical bool
}

// SendResult tells callers which tokens are dead so they can be deleted.
type SendResult struct {
	Success   int
	Failure   int
	DeadTokens []string
}

type Sender interface {
	Send(ctx context.Context, msgs []Message) SendResult
}

// New returns a Sender: a real Firebase client if credentialsPath is set,
// otherwise a no-op that logs the outbound payload (useful for local dev and
// integration tests without a Firebase project).
func New(ctx context.Context, credentialsPath string) (Sender, error) {
	if credentialsPath == "" {
		slog.Warn("fcm: FCM_CREDENTIALS is empty — using no-op sender (payloads will be logged)")
		return &noopSender{}, nil
	}
	app, err := firebase.NewApp(ctx, nil, option.WithCredentialsFile(credentialsPath))
	if err != nil {
		return nil, err
	}
	client, err := app.Messaging(ctx)
	if err != nil {
		return nil, err
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
