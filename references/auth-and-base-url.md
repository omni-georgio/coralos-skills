# Auth and Base URL

Shared setup for all Coral Cloud API helpers in this repository.

## Environment

- `export CORAL_API_KEY="your_api_key"`

## Headers

- `Authorization: Bearer $CORAL_API_KEY`
- `Content-Type: application/json`

## Base URL

- `https://api.coralcloud.ai`

## Quick Validation

Before running larger flows, verify:

- API key is present in your shell
- the target endpoint is live in your environment
- helper scripts match the currently supported route format