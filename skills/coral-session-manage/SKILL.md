---
name: coral-session-manage
description: Monitor, inspect, and close Coral Cloud sessions by polling session state, tracking thread-visible output, and handling lifecycle cleanup.
---

# Coral Session Manage

Use this skill for runtime observation after a session has been created.

## Scope

- Read session state by namespace and session ID.
- Poll for readiness and progress.
- Confirm thread-visible output in Coral Cloud UI.
- Close sessions when done.

## Live Endpoint Status

- Known-good state route: `GET /api/v1/local/session/{namespace}/{sessionId}`
- Verify list and delete routes against your environment before automating cleanup loops.

## Fast Command

- `bash scripts/get_session_state.sh <namespace> <session_id>`

Success criteria:

- real state payload for the target session
- evidence of agent progress and/or thread activity

## Lifecycle Checklist

- session exists
- agents connect and begin execution
- output appears in Coral Cloud thread when requested
- session is closed when no longer needed
