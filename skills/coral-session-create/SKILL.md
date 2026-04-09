---
name: coral-session-create
description: Configure and launch Coral Cloud sessions by composing valid payloads from registry-selected agents, runtime settings, and optional webhook/custom tool definitions.
---

# Coral Session Create

Use this skill to build and submit `POST /api/v1/local/session` payloads after agent discovery is complete.

## Scope

- Build a valid session payload from known-good agent IDs.
- Configure runtime settings, namespace behavior, and execution mode.
- Launch a session and capture returned identifiers.

## Live Endpoint Status

- Known-good create route: `POST /api/v1/local/session`
- Payload shape can be strict; start from known-good examples in `examples/payloads/`.

## Fast Command

- `bash scripts/create_session.sh examples/payloads/echo-session.json`

Success criteria:

- non-error API response
- real `sessionId` in response

## Notes

- Keep custom tool/webhook flows in this skill, but treat them as experimental until callback host policy is confirmed in your environment.
