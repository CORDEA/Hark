package models

import "time"

const (
	AlertStatusActive   = "active"
	AlertStatusResolved = "resolved"

	RecipientPending      = "pending"
	RecipientAcknowledged = "acknowledged"
	RecipientDeclined     = "declined"

	// AdminResponderID is a sentinel string stored in Alert.ResponderID when
	// the alert was manually resolved from the admin dashboard. It is not a
	// valid users.id and is mapped to the display name "Admin" at read time.
	AdminResponderID = "admin"

	WebAuthnPurposeRegister = "register"
	WebAuthnPurposeAssert   = "assert"

	// ServerMetaSingletonID is the fixed primary key for the single-row
	// server_meta table. Any additional row is rejected at insert time.
	ServerMetaSingletonID uint = 1
)

type User struct {
	ID          string    `gorm:"primaryKey;size:64" json:"id"`
	DisplayName string    `gorm:"size:120" json:"display_name"`
	CreatedAt   time.Time `json:"created_at"`

	Devices     []Device     `gorm:"constraint:OnDelete:CASCADE" json:"devices,omitempty"`
	Credentials []Credential `gorm:"constraint:OnDelete:CASCADE" json:"credentials,omitempty"`
}

type Device struct {
	ID         string `gorm:"primaryKey;size:64" json:"id"`
	UserID     string `gorm:"size:64;index" json:"user_id"`
	FCMToken   string `gorm:"uniqueIndex;size:512" json:"fcm_token"`
	DeviceName string `gorm:"size:120" json:"device_name"`
	// Locale is the BCP-47 tag the device reported at register (e.g. "en",
	// "en-US"). Used by the FCM sender to pick a localized notification
	// title/body. Defaults to "en" for legacy rows.
	Locale    string    `gorm:"size:16;default:en" json:"locale"`
	CreatedAt time.Time `json:"created_at"`
}

type Alert struct {
	ID          string     `gorm:"primaryKey;size:64" json:"id"`
	Type        string     `gorm:"size:16;index" json:"type"`
	Status      string     `gorm:"size:16;index" json:"status"`
	ResponderID *string    `gorm:"size:64" json:"responder_id"`
	IsBroadcast bool       `gorm:"not null;default:false" json:"is_broadcast"`
	TriggeredAt time.Time  `gorm:"index" json:"triggered_at"`
	ResolvedAt  *time.Time `json:"resolved_at"`

	Recipients []AlertRecipient `gorm:"constraint:OnDelete:CASCADE" json:"recipients,omitempty"`
}

type AlertRecipient struct {
	AlertID        string     `gorm:"primaryKey;size:64" json:"alert_id"`
	UserID         string     `gorm:"primaryKey;size:64" json:"user_id"`
	ResponseStatus string     `gorm:"size:16;index" json:"response_status"`
	RespondedAt    *time.Time `json:"responded_at"`
}

// Invitation is a single-use, TTL-bound token that authorizes a WebAuthn
// register ceremony. A nil TargetUserID marks a first-time-join invitation
// (a fresh user is created on finish); a set TargetUserID marks an
// add-device invitation that attaches a new credential to the existing user.
type Invitation struct {
	ID           uint       `gorm:"primaryKey" json:"id"`
	Code         string     `gorm:"uniqueIndex;size:32" json:"code"`
	DisplayName  string     `gorm:"size:120" json:"display_name"`
	TargetUserID *string    `gorm:"size:64;index" json:"target_user_id,omitempty"`
	CreatedAt    time.Time  `json:"created_at"`
	ExpiresAt    time.Time  `json:"expires_at"`
	UsedAt       *time.Time `json:"used_at,omitempty"`
	UsedByUserID *string    `gorm:"size:64" json:"used_by_user_id,omitempty"`
}

// Credential is a stored WebAuthn public-key credential attached to a user.
// Deletion cascades from the owning User row — this is the mechanism behind
// the spec's "instant session invalidation" story: once the user is deleted,
// their credentials disappear and JWT-authed calls fail their existence
// check.
type Credential struct {
	ID              uint       `gorm:"primaryKey" json:"id"`
	UserID          string     `gorm:"size:64;index" json:"user_id"`
	CredentialID    []byte     `gorm:"uniqueIndex;size:255" json:"credential_id"`
	PublicKey       []byte     `json:"public_key"`
	SignCount       uint32     `json:"sign_count"`
	AAGUID          []byte     `json:"aaguid"`
	Transports      string     `gorm:"size:255" json:"transports"`
	AttestationType string     `gorm:"size:32" json:"attestation_type"`
	Nickname        string     `gorm:"size:120" json:"nickname"`
	CreatedAt       time.Time  `json:"created_at"`
	LastUsedAt      *time.Time `json:"last_used_at,omitempty"`
}

// WebAuthnChallenge holds a pending WebAuthn ceremony challenge. Rows are
// created by /begin, consumed by /finish, and swept after ExpiresAt.
type WebAuthnChallenge struct {
	ID             uint      `gorm:"primaryKey" json:"id"`
	Challenge      []byte    `gorm:"uniqueIndex;size:64" json:"challenge"`
	Purpose        string    `gorm:"size:16;index" json:"purpose"`
	InvitationCode *string   `gorm:"size:32;index" json:"invitation_code,omitempty"`
	UserID         *string   `gorm:"size:64;index" json:"user_id,omitempty"`
	SessionData    []byte    `json:"session_data"`
	CreatedAt      time.Time `json:"created_at"`
	ExpiresAt      time.Time `json:"expires_at"`
}

// ServerMeta is a single-row table (id=1) seeded on first boot. It carries
// server-lifetime secrets and identity: the WebAuthn Relying Party ID
// (derived from PUBLIC_URL) and the HS256 JWT signing key. Persisting both
// keeps the "drop the compose file and go" self-hosting story intact — no
// env plumbing required for these secrets.
type ServerMeta struct {
	ID            uint      `gorm:"primaryKey" json:"id"`
	RPID          string    `gorm:"size:255" json:"rp_id"`
	JWTSigningKey []byte    `gorm:"size:64" json:"-"`
	CreatedAt     time.Time `json:"created_at"`
}
