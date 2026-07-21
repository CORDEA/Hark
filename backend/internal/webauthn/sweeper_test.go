package webauthn

import (
	"context"
	"testing"
	"time"

	"github.com/google/uuid"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"

	"github.com/cordea/hark/internal/models"
)

func TestSweeperDeletesExpiredKeepsFresh(t *testing.T) {
	db := openMemDB(t)
	now := time.Now().UTC()
	rows := []models.WebAuthnChallenge{
		{Challenge: []byte("expired-a"), Purpose: models.WebAuthnPurposeRegister, CreatedAt: now.Add(-time.Hour), ExpiresAt: now.Add(-30 * time.Minute)},
		{Challenge: []byte("expired-b"), Purpose: models.WebAuthnPurposeAssert, CreatedAt: now.Add(-time.Hour), ExpiresAt: now.Add(-time.Minute)},
		{Challenge: []byte("fresh"), Purpose: models.WebAuthnPurposeRegister, CreatedAt: now, ExpiresAt: now.Add(5 * time.Minute)},
	}
	for i := range rows {
		if err := db.Create(&rows[i]).Error; err != nil {
			t.Fatalf("seed: %v", err)
		}
	}

	sw := &ChallengeSweeper{DB: db}
	sw.sweepOnce(context.Background())

	var remaining []models.WebAuthnChallenge
	if err := db.Find(&remaining).Error; err != nil {
		t.Fatalf("find: %v", err)
	}
	if len(remaining) != 1 {
		t.Fatalf("remaining = %d, want 1", len(remaining))
	}
	if string(remaining[0].Challenge) != "fresh" {
		t.Fatalf("wrong row survived: %s", remaining[0].Challenge)
	}
}

func openMemDB(t *testing.T) *gorm.DB {
	t.Helper()
	dsn := "file:" + uuid.NewString() + "?mode=memory&cache=shared&_fk=1"
	db, err := gorm.Open(sqlite.Open(dsn), &gorm.Config{
		Logger: gormlogger.Default.LogMode(gormlogger.Silent),
	})
	if err != nil {
		t.Fatalf("open sqlite: %v", err)
	}
	if err := db.AutoMigrate(&models.WebAuthnChallenge{}); err != nil {
		t.Fatalf("automigrate: %v", err)
	}
	sqlDB, err := db.DB()
	if err != nil {
		t.Fatalf("db handle: %v", err)
	}
	t.Cleanup(func() { _ = sqlDB.Close() })
	return db
}
