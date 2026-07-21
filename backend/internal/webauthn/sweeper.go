package webauthn

import (
	"context"
	"log/slog"
	"time"

	"gorm.io/gorm"

	"github.com/cordea/hark/internal/models"
)

// DefaultSweepInterval is how often ChallengeSweeper walks the challenges
// table. Chosen to be much smaller than the challenge TTL (~5 min) so a
// dead row is never more than one interval past its expiry, but large
// enough that the query never becomes a hot loop against SQLite.
const DefaultSweepInterval = time.Minute

// ChallengeSweeper deletes past-TTL rows from webauthn_challenges on a
// timer. Assertion ceremonies (M5) have no invitation code, so /begin
// can't opportunistically purge the last one for the same key — without a
// sweeper those rows would accrete indefinitely.
type ChallengeSweeper struct {
	DB       *gorm.DB
	Interval time.Duration
}

// Run blocks until ctx is done, sweeping every Interval. Errors are
// logged (not surfaced) — a transient DB failure shouldn't kill the
// process; the next tick will retry.
func (s *ChallengeSweeper) Run(ctx context.Context) {
	interval := s.Interval
	if interval <= 0 {
		interval = DefaultSweepInterval
	}
	ticker := time.NewTicker(interval)
	defer ticker.Stop()
	for {
		select {
		case <-ctx.Done():
			return
		case <-ticker.C:
			s.sweepOnce(ctx)
		}
	}
}

// sweepOnce is exposed at package scope so tests can drive one iteration
// without racing against wall-clock ticks.
func (s *ChallengeSweeper) sweepOnce(ctx context.Context) {
	now := time.Now().UTC()
	res := s.DB.WithContext(ctx).
		Where("expires_at < ?", now).
		Delete(&models.WebAuthnChallenge{})
	if res.Error != nil {
		slog.Warn("challenge sweeper", "err", res.Error)
		return
	}
	if res.RowsAffected > 0 {
		slog.Info("challenge sweeper", "expired", res.RowsAffected)
	}
}
