---

## name: run-remote-coralos-agent

description: Run CoralOS agent workflows over the API, including Coral Cloud hosted sessions, registry checks, payload construction, UI-visible thread outputs, and debugging common validation failures.

# Run Remote CoralOS Agent

Reusable skill for launching and debugging CoralOS agents through API sessions, including Coral Cloud hosted runs.

## Quick Start

1. Export your API key:
  - `export CORAL_API_KEY="your_api_key"`
2. Confirm auth and list registry agents:
  - `bash scripts/list_registry_agents.sh`
3. Create a session:
  - `bash scripts/create_session.sh examples/payloads/echo-session.json`
4. Check session state:
  - `bash scripts/get_session_state.sh <namespace> <session_id>`

## Endpoints That Work

- Create session: `POST https://api.coralcloud.ai/api/v1/local/session`
- Session state: `GET https://api.coralcloud.ai/api/v1/local/session/{namespace}/{sessionId}`

## Payload Requirements (Important)

Live payloads required more fields than the docs implied:

- `registrySourceId`
- nested `annotations: {}`
- `execution.runtimeSettings`
- `extendedEndReport`

Use the example payloads in `examples/payloads/` as your baseline.

## Agent Patterns

- **Echo smoke test**: use `examples/payloads/echo-session.json`
- **DeepWiki repo analysis**: use `examples/payloads/deepwiki-analysis-session.json`
- **UI-visible output**: explicitly instruct the agent to create a thread in Coral Cloud console and write findings there

Suggested instruction text:

`Create a new thread in this Coral Cloud session and write your full findings there, including summary, key evidence, and next actions.`

## Known Limitations

- Output retrieval from API is still not reliable for all runs.
- Custom-tool/webhook output appears gated by allowed callback hosts.
- Disposable hosts and Cloudflare Worker attempts can fail with `custom_tools_hostname_fkey`.

See `references/coralos-api-notes.md` for details.

## Debugging Validation Errors

When Coral returns confusing validation errors:

1. Start from `examples/payloads/echo-session.json`.
2. Add one change at a time.
3. Confirm the required keys exist exactly:
  - `registrySourceId`
  - `annotations` object
  - `execution.runtimeSettings`
  - `extendedEndReport`
4. Re-run with `scripts/create_session.sh`.
5. Inspect state with `scripts/get_session_state.sh`.

## Additional References

- Practical notes: `references/coralos-api-notes.md`
- Payload walkthroughs: `references/payloads.md`
