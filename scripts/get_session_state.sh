#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <namespace> <session_id>"
  exit 1
fi

NAMESPACE="$1"
SESSION_ID="$2"

if [[ -z "${CORAL_API_KEY:-}" ]]; then
  echo "CORAL_API_KEY is required."
  echo "Example: export CORAL_API_KEY=\"your_api_key\""
  exit 1
fi

curl -sS \
  -H "Authorization: Bearer ${CORAL_API_KEY}" \
  -H "Content-Type: application/json" \
  "https://api.coralcloud.ai/api/v1/local/session/${NAMESPACE}/${SESSION_ID}" | jq .
