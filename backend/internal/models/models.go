package models

import "time"

const (
	UserStatusActive  = "active"
	UserStatusInvited = "invited"

	AlertTypeCritical = "critical"
	AlertTypeWarning  = "warning"

	AlertStatusActive   = "active"
	AlertStatusResolved = "resolved"

	RecipientPending      = "pending"
	RecipientAcknowledged = "acknowledged"
	RecipientDeclined     = "declined"

	// AdminResponderID is a sentinel string stored in Alert.ResponderID when
	// the alert was manually resolved from the admin dashboard. It is not a
	// valid users.id and is mapped to the display name "Admin" at read time.
	AdminResponderID = "admin"
)

type User struct {
	ID             string    `gorm:"primaryKey;size:64" json:"id"`
	DisplayName    string    `gorm:"size:120" json:"display_name"`
	InvitationCode string    `gorm:"uniqueIndex;size:32" json:"invitation_code"`
	Status         string    `gorm:"size:16;index" json:"status"`
	CreatedAt      time.Time `json:"created_at"`

	Devices []Device `gorm:"constraint:OnDelete:CASCADE" json:"devices,omitempty"`
}

type Device struct {
	ID         string    `gorm:"primaryKey;size:64" json:"id"`
	UserID     string    `gorm:"size:64;index" json:"user_id"`
	FCMToken   string    `gorm:"uniqueIndex;size:512" json:"fcm_token"`
	DeviceName string    `gorm:"size:120" json:"device_name"`
	CreatedAt  time.Time `json:"created_at"`
}

type Alert struct {
	ID           string     `gorm:"primaryKey;size:64" json:"id"`
	Type         string     `gorm:"size:16;index" json:"type"`
	Status       string     `gorm:"size:16;index" json:"status"`
	ResponderID  *string    `gorm:"size:64" json:"responder_id"`
	IsBroadcast  bool       `gorm:"not null;default:false" json:"is_broadcast"`
	TriggeredAt  time.Time  `gorm:"index" json:"triggered_at"`
	ResolvedAt   *time.Time `json:"resolved_at"`

	Recipients []AlertRecipient `gorm:"constraint:OnDelete:CASCADE" json:"recipients,omitempty"`
}

type AlertRecipient struct {
	AlertID        string     `gorm:"primaryKey;size:64" json:"alert_id"`
	UserID         string     `gorm:"primaryKey;size:64" json:"user_id"`
	ResponseStatus string     `gorm:"size:16;index" json:"response_status"`
	RespondedAt    *time.Time `json:"responded_at"`
}
