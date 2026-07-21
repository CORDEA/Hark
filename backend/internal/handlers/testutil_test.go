package handlers

import (
	"bytes"
	"context"
	"encoding/json"
	"io"
	"io/fs"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	"github.com/google/uuid"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"

	"github.com/cordea/hark/internal/auth"
	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/models"
	"github.com/cordea/hark/internal/services/alerts"
	"github.com/cordea/hark/internal/services/fcm"
)

// testHarness bundles the DB + API + a chi router mounted at the same path
// prefix as production so a single test can drive requests end-to-end.
type testHarness struct {
	t      *testing.T
	DB     *gorm.DB
	Signer *auth.Signer
	API    *API
	Server *httptest.Server
}

func newTestHarness(t *testing.T) *testHarness {
	t.Helper()
	db := openInMemoryDB(t)
	cfg := config.Config{
		PublicURL: "https://hark.test",
		OrgName:   "Hark Test",
	}
	signer := auth.NewSigner(bytes.Repeat([]byte{0x11}, auth.SigningKeyBytes), cfg.PublicURL)
	svc := &alerts.Service{
		DB:        db,
		Sender:    stubSender{},
		Localizer: nil,
		PublicURL: cfg.PublicURL,
	}
	api := &API{
		DB:     db,
		Config: cfg,
		Alerts: svc,
		RP:     nil, // WebAuthn ceremony tests aren't exercised here.
		Signer: signer,
	}
	router := NewRouter(Deps{
		DB:     db,
		Config: cfg,
		Web:    emptyFS{},
		Alerts: svc,
		RP:     nil,
		Signer: signer,
	})
	srv := httptest.NewServer(router)
	t.Cleanup(srv.Close)
	return &testHarness{t: t, DB: db, Signer: signer, API: api, Server: srv}
}

// openInMemoryDB returns a fresh SQLite in-memory DB with the same schema
// as production. Each test gets its own connection.
func openInMemoryDB(t *testing.T) *gorm.DB {
	t.Helper()
	// `file::memory:?cache=shared` shares a single db across connections in
	// the same process. We give it a unique name per invocation so parallel
	// tests don't cross-contaminate.
	dsn := "file:" + uuid.NewString() + "?mode=memory&cache=shared&_fk=1"
	db, err := gorm.Open(sqlite.Open(dsn), &gorm.Config{
		Logger: gormlogger.Default.LogMode(gormlogger.Silent),
	})
	if err != nil {
		t.Fatalf("open sqlite: %v", err)
	}
	if err := db.AutoMigrate(
		&models.User{},
		&models.Device{},
		&models.Alert{},
		&models.AlertRecipient{},
		&models.Invitation{},
		&models.Credential{},
		&models.WebAuthnChallenge{},
		&models.ServerMeta{},
	); err != nil {
		t.Fatalf("automigrate: %v", err)
	}
	// Keep the underlying connection alive for the lifetime of the test —
	// SQLite `:memory:` disappears when the last connection closes.
	sqlDB, err := db.DB()
	if err != nil {
		t.Fatalf("db handle: %v", err)
	}
	t.Cleanup(func() { _ = sqlDB.Close() })
	return db
}

// seedUserWithDevice creates a user, one credential, and (if fcmToken is
// non-empty) one device. Returns the user + a fresh JWT for them.
func (h *testHarness) seedUserWithDevice(fcmToken string) (models.User, string) {
	h.t.Helper()
	user := models.User{
		ID:          uuid.NewString(),
		DisplayName: "Test User",
		CreatedAt:   time.Now().UTC(),
	}
	if err := h.DB.Create(&user).Error; err != nil {
		h.t.Fatalf("create user: %v", err)
	}
	cred := models.Credential{
		UserID:       user.ID,
		CredentialID: []byte(uuid.NewString()),
		PublicKey:    []byte("stub-key"),
		SignCount:    0,
		CreatedAt:    time.Now().UTC(),
	}
	if err := h.DB.Create(&cred).Error; err != nil {
		h.t.Fatalf("create cred: %v", err)
	}
	if fcmToken != "" {
		device := models.Device{
			ID:         uuid.NewString(),
			UserID:     user.ID,
			FCMToken:   fcmToken,
			DeviceName: "test device",
			Locale:     "en",
			CreatedAt:  time.Now().UTC(),
		}
		if err := h.DB.Create(&device).Error; err != nil {
			h.t.Fatalf("create device: %v", err)
		}
	}
	token, _, err := h.Signer.Sign(user.ID, cred.CredentialID)
	if err != nil {
		h.t.Fatalf("sign: %v", err)
	}
	return user, token
}

func (h *testHarness) do(method, path, token string, body any) *http.Response {
	h.t.Helper()
	var reader io.Reader
	if body != nil {
		buf, err := json.Marshal(body)
		if err != nil {
			h.t.Fatalf("marshal: %v", err)
		}
		reader = bytes.NewReader(buf)
	}
	req, err := http.NewRequest(method, h.Server.URL+path, reader)
	if err != nil {
		h.t.Fatalf("new request: %v", err)
	}
	if token != "" {
		req.Header.Set("Authorization", "Bearer "+token)
	}
	if body != nil {
		req.Header.Set("Content-Type", "application/json")
	}
	res, err := http.DefaultClient.Do(req)
	if err != nil {
		h.t.Fatalf("do: %v", err)
	}
	return res
}

func decodeEnvelope(t *testing.T, res *http.Response) Envelope {
	t.Helper()
	defer res.Body.Close()
	var env Envelope
	if err := json.NewDecoder(res.Body).Decode(&env); err != nil {
		t.Fatalf("decode envelope: %v", err)
	}
	return env
}

// emptyFS lets NewRouter mount the static file handler without needing a
// real embedded FS during tests.
type emptyFS struct{}

func (emptyFS) Open(name string) (fs.File, error) { return nil, fs.ErrNotExist }

// stubSender is a no-op FCM sender used by handler tests that don't care
// about push delivery.
type stubSender struct{}

func (stubSender) Send(ctx context.Context, msgs []fcm.Message) fcm.SendResult {
	return fcm.SendResult{}
}
