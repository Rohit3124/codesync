#!/usr/bin/env bash
set -euo pipefail

# Railpack entrypoint script. Railpack expects a start.sh to determine how to
# build/run the application. This script prefers the Railway CLI to build
# services, and falls back to Docker Compose when the Railway CLI isn't
# available.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

echo "Railpack start.sh: repo root -> $ROOT_DIR"

if command -v railway >/dev/null 2>&1; then
  echo "Found Railway CLI. Running: railway up --build"
  railway up --build
  exit $?
fi

# Prefer Docker Compose v2 (`docker compose`) but handle classic `docker-compose`
if command -v docker >/dev/null 2>&1; then
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

echo "Error: neither 'railway' nor Docker Compose are available in PATH."
echo "Install Railway CLI or Docker Compose to let Railpack build the app."
exit 1
