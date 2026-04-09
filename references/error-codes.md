# Common API Errors

Quick reference for common failures seen while testing Coral Cloud sessions.

## Not Found

- Symptom: `{"message":"Not found"}`
- Typical cause: stale or incorrect endpoint path
- Action: verify route against current API docs and update scripts

## Validation Errors

- Symptom: payload rejected with field-level errors
- Typical cause: missing required nested fields
- Action: start from `examples/payloads/echo-session.json` and add changes incrementally

## Custom Tool Host Restriction

- Symptom: `custom_tools_hostname_fkey`
- Typical cause: callback host blocked by Coral policy
- Action: use an approved hostname or defer custom tool callback tests