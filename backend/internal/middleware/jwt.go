package middleware

import (
	"context"
	"encoding/json"
	"errors"
	"net/http"
	"strings"

	"gorm.io/gorm"

	"github.com/cordea/hark/internal/auth"
	"github.com/cordea/hark/internal/models"
)

type ctxKey int

const userCtxKey ctxKey = iota

// UserFromContext returns the user attached by the JWT middleware. Handlers
// mounted under JWT should not need to check ok in practice — a missing user
// means the request bypassed the middleware, which is a wiring bug.
func UserFromContext(ctx context.Context) (models.User, bool) {
	u, ok := ctx.Value(userCtxKey).(models.User)
	return u, ok
}

// JWT verifies the Bearer token, loads the User by claim.sub, and injects
// the User into the request context. A missing user (kicked, cascade
// deleted) fails with 401 — this is the "instant session invalidation"
// mechanism from spec §4.
func JWT(db *gorm.DB, signer *auth.Signer) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			authHeader := r.Header.Get("Authorization")
			const bearer = "Bearer "
			if !strings.HasPrefix(authHeader, bearer) {
				writeUnauth(w, "missing bearer token")
				return
			}
			raw := strings.TrimSpace(strings.TrimPrefix(authHeader, bearer))
			claims, err := signer.Parse(raw)
			if err != nil {
				writeUnauth(w, "invalid token")
				return
			}
			var user models.User
			if err := db.First(&user, "id = ?", claims.Subject).Error; err != nil {
				if errors.Is(err, gorm.ErrRecordNotFound) {
					writeUnauth(w, "user not found")
					return
				}
				writeServerErr(w)
				return
			}
			ctx := context.WithValue(r.Context(), userCtxKey, user)
			next.ServeHTTP(w, r.WithContext(ctx))
		})
	}
}

type errBody struct {
	Error errPayload `json:"error"`
}

type errPayload struct {
	Code    string `json:"code"`
	Message string `json:"message"`
}

func writeUnauth(w http.ResponseWriter, msg string) {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.WriteHeader(http.StatusUnauthorized)
	_ = json.NewEncoder(w).Encode(errBody{Error: errPayload{Code: "unauthorized", Message: msg}})
}

func writeServerErr(w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.WriteHeader(http.StatusInternalServerError)
	_ = json.NewEncoder(w).Encode(errBody{Error: errPayload{Code: "db", Message: "lookup failed"}})
}
