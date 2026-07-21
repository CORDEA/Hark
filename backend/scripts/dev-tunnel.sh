#!/usr/bin/env bash
# Starts the Cloudflare Tunnel using backend/cloudflared/config.yml.
# See backend/cloudflared/config.example.yml for setup steps.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CONFIG="${REPO_ROOT}/backend/cloudflared/config.yml"

if [ ! -f "${CONFIG}" ]; then
  echo "error: ${CONFIG} not found." >&2
  echo "copy backend/cloudflared/config.example.yml to config.yml and fill in the placeholders." >&2
  exit 1
fi

if ! command -v cloudflared >/dev/null 2>&1; then
  echo "error: cloudflared not installed. brew install cloudflared" >&2
  exit 1
fi

exec cloudflared tunnel --config "${CONFIG}" run
