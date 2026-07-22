# syntax=docker/dockerfile:1.7

# Build stage: full Go toolchain, CGO on for the SQLite driver.
# 1.25 matches the toolchain go.mod pulls in via GOTOOLCHAIN=auto.
FROM golang:1.25-alpine AS build
RUN apk add --no-cache build-base git
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=1 GOOS=linux go build -trimpath -ldflags="-s -w" \
    -o /out/hark ./cmd/hark

# Runtime stage: minimal alpine + libc + sqlite runtime + CA certs.
FROM alpine:3.20
RUN apk add --no-cache ca-certificates sqlite-libs tzdata \
    && adduser -D -H -u 10001 hark \
    && mkdir -p /data \
    && chown hark:hark /data
USER hark
WORKDIR /home/hark
COPY --from=build /out/hark /usr/local/bin/hark

# PUBLIC_URL is intentionally not defaulted — the process refuses to boot
# without it. Every passkey is bound to the URL's hostname, so a silent
# fallback would let a misconfigured deploy register credentials against
# the wrong origin.
ENV PORT=8080 \
    DB_DRIVER=sqlite \
    DB_DSN="file:/data/hark.db?_pragma=journal_mode(WAL)&_pragma=foreign_keys(1)" \
    FCM_CREDENTIALS=/data/firebase.json \
    ORG_NAME=Hark

VOLUME ["/data"]
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -qO- http://localhost:8080/api/health >/dev/null || exit 1

ENTRYPOINT ["/usr/local/bin/hark"]
