# Payload Reference

This repo includes three copy-pasteable payload shapes under `examples/payloads/`.

## 1) Basic Echo Session

File: `examples/payloads/echo-session.json`

Use this first to verify:

- API key is valid
- payload shape is accepted
- session creation and state check both work

## 2) DeepWiki Repo Analysis Session

File: `examples/payloads/deepwiki-analysis-session.json`

Use this to run marketplace DeepWiki against a repository target.

Recommended instruction style:

- Ask for concise analysis
- Require writing results to a Coral Cloud thread
- Include sections (summary, findings, risks, actions)

## 3) Custom Tool / Webhook Output Attempt

File: `examples/payloads/custom-tool-webhook-attempt.json`

Use this as a diagnostic example. Expect host validation issues unless callback host is accepted by Coral Cloud policy.

Common failure signal:

- `custom_tools_hostname_fkey`

## Field Notes

The following keys were important in live payloads:

- `registrySourceId`
- `annotations` (object, can be `{}`)
- `execution.runtimeSettings`
- `extendedEndReport`

If a new payload fails unexpectedly, compare against `echo-session.json` and reintroduce changes one at a time.