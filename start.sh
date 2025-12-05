#!/usr/bin/env bash
set -euo pipefail

# Root start.sh for Railpack/Railway — delegates to railpack-app/start.sh
# If `railpack-app/start.sh` is missing, fall back to a local build using
# docker compose or railway CLI if available.

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
RAILPACK_SCRIPT="$ROOT_DIR/railpack-app/start.sh"

if [ -x "$RAILPACK_SCRIPT" ]; then
  echo "Delegating to $RAILPACK_SCRIPT"
  exec "$RAILPACK_SCRIPT"
fi

# Fallback behaviour: try Railway CLI, then docker compose, then docker-compose
if command -v railway >/dev/null 2>&1; then
  echo "Found Railway CLI. Running: railway up --build"
  cd "$ROOT_DIR"
  railway up --build
  exit $?
fi

if command -v docker >/dev/null 2>&1; then
  cd "$ROOT_DIR"
  if docker compose version >/dev/null 2>&1; then
    echo "Using Docker Compose (docker compose) to build+up services"
    docker compose up --build
    exit $?
  elif command -v docker-compose >/dev/null 2>&1; then
    echo "Using docker-compose to build+up services"
    docker-compose up --build
    exit $?
  fi
fi

echo "Error: neither 'railway' nor Docker Compose are available in PATH, and no railpack-app/start.sh was found."
echo "Install Railway CLI or Docker Compose, or add railpack-app/start.sh."
exit 1
