# Coral Cloud API Notes

Implementation-oriented notes from debugging real Coral Cloud runs.

## What Works

- Authentication via Bearer token using `Authorization: Bearer $CORAL_API_KEY`.
- Registry access with Bearer auth.
- Session creation route:
  - `POST https://api.coralcloud.ai/api/v1/local/session`
- Session state route:
  - `GET https://api.coralcloud.ai/api/v1/local/session/{namespace}/{sessionId}`
- DeepWiki can run successfully via marketplace agent payload.
- UI-visible result pattern: instruct the agent to create a thread and write findings there.

## What Is Still Flaky

- Consistent output retrieval directly through API after run completion.
- Custom-tool/webhook callback behavior and acceptance of callback hosts.
- Callback hosts that look valid can still fail with `custom_tools_hostname_fkey`.

## What We Learned

- Docs were close, but not sufficient for first-time successful runs.
- Live payloads required keys that were easy to miss:
  - `registrySourceId`
  - `annotations: {}`
  - `execution.runtimeSettings`
  - `extendedEndReport`
- Iterating from a minimal known-good payload was much faster than trying to satisfy validation errors from scratch.

## Debugging Coral Validation Errors

Use this loop:

1. Start with known-good payload (`examples/payloads/echo-session.json`).
2. Keep headers minimal and correct:
  - `Authorization: Bearer $CORAL_API_KEY`
  - `Content-Type: application/json`
3. Change one payload section per attempt.
4. If create-session succeeds, immediately check state route.
5. If output is missing in API response, instruct agent to write to thread and verify in Coral Cloud UI.

## Custom Tool / Webhook Restriction Notes

- Disposable/test webhook hosts often fail.
- A Cloudflare Worker endpoint also failed under current checks.
- Error observed: `custom_tools_hostname_fkey`.
- Interpretation: Coral likely enforces an allowlist or stricter callback host policy.

## Practical Recommendation

- For now, prioritize thread-based reporting for dependable visibility.
- Treat custom-tool callbacks as environment-constrained until host rules are clarified.