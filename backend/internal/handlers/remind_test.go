package handlers

import (
	"net/http"
	"testing"
	"time"

	"github.com/google/uuid"

	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/models"
)

func TestRemindActiveAlertResendsWithoutChangingState(t *testing.T) {
	h := newTestHarness(t)
	var err error
	h.API.Alerts.AlertTypes, err = config.LoadAlertTypes("../../data/alert_types.json")
	if err != nil {
		t.Fatalf("load alert types: %v", err)
	}
	user, _ := h.seedUserWithDevice("remind-token")
	alert := models.Alert{
		ID: uuid.NewString(), Type: h.API.Alerts.AlertTypes.List[0].ID,
		Status: models.AlertStatusActive, IsBroadcast: false,
		TriggeredAt: time.Now().UTC(),
	}
	if err := h.DB.Create(&alert).Error; err != nil {
		t.Fatalf("create alert: %v", err)
	}
	recipient := models.AlertRecipient{
		AlertID: alert.ID, UserID: user.ID,
		ResponseStatus: models.RecipientAcknowledged,
		RespondedAt:    ptrTime(time.Now().UTC()),
	}
	if err := h.DB.Create(&recipient).Error; err != nil {
		t.Fatalf("create recipient: %v", err)
	}

	res := h.do(http.MethodPost, "/api/alerts/"+alert.ID+"/remind-admin", "", nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("remind: got %d, want 200", res.StatusCode)
	}
	env := decodeEnvelope(t, res)
	data, ok := env.Data.(map[string]any)
	if !ok || data["sent"] != float64(1) {
		t.Fatalf("remind response = %#v, want sent=1", env.Data)
	}

	var got models.Alert
	if err := h.DB.First(&got, "id = ?", alert.ID).Error; err != nil {
		t.Fatalf("reload alert: %v", err)
	}
	if got.Status != models.AlertStatusActive {
		t.Fatalf("status = %q, want active", got.Status)
	}
	var gotRecipient models.AlertRecipient
	if err := h.DB.First(&gotRecipient, "alert_id = ? AND user_id = ?", alert.ID, user.ID).Error; err != nil {
		t.Fatalf("reload recipient: %v", err)
	}
	if gotRecipient.ResponseStatus != models.RecipientAcknowledged {
		t.Fatalf("recipient status = %q, want acknowledged", gotRecipient.ResponseStatus)
	}
}

func ptrTime(t time.Time) *time.Time { return &t }
