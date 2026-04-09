#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${CORAL_API_KEY:-}" ]]; then
  echo "CORAL_API_KEY is required."
  echo "Example: export CORAL_API_KEY=\"your_api_key\""
  exit 1
fi

curl -sS \
  -H "Authorization: Bearer ${CORAL_API_KEY}" \
  -H "Content-Type: application/json" \
  "https://api.coralcloud.ai/api/v1/local/registry/agents" | jq .
