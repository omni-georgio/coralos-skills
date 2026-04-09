#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <payload.json>"
  exit 1
fi

PAYLOAD_FILE="$1"

if [[ -z "${CORAL_API_KEY:-}" ]]; then
  echo "CORAL_API_KEY is required."
  echo "Example: export CORAL_API_KEY=\"your_api_key\""
  exit 1
fi

if [[ ! -f "${PAYLOAD_FILE}" ]]; then
  echo "Payload file not found: ${PAYLOAD_FILE}"
  exit 1
fi

curl -sS \
  -X POST "https://api.coralcloud.ai/api/v1/local/session" \
  -H "Authorization: Bearer ${CORAL_API_KEY}" \
  -H "Content-Type: application/json" \
  --data @"${PAYLOAD_FILE}" | jq .
