

# CoralOS Skills Starter

General-purpose starter repo for reusable skills and examples when building with CoralOS.

<img width="1168" height="365" alt="Screenshot_2026-04-09_at_16 35 51" src="https://github.com/user-attachments/assets/be601379-df79-433b-b17b-cf7ac0f99d52" />

## Install With `npx skills`

Install and use skills through the `npx skills` CLI:

1. `npx skills`
2. `npx skills add coralos/skills`

## Links

- Getting started guide: [Using the Coral Cloud API](https://docs.coralos.ai/cloud/using-api)
- Coral Cloud API docs: [Coral Cloud 1-Page API Reference](https://docs.coralos.ai/cloud/using-api#coral-cloud-1-page-api-reference)
- Coral Cloud dashboard: [coralcloud.ai/dashboard](https://coralcloud.ai/dashboard)
- OpenClaw setup guide: `guides/coralos-openclaw-setup-guide.md`

## Included

- `skills/coral-registry/SKILL.md` - discover and inspect available agents
- `skills/coral-session-create/SKILL.md` - configure and launch sessions
- `skills/coral-session-manage/SKILL.md` - monitor, inspect, and close sessions
- `references/coralos-api-notes.md` - what worked, what was flaky, and debugging notes
- `references/payloads.md` - payload-level guidance
- `references/auth-and-base-url.md` - shared auth/header/base URL setup
- `references/error-codes.md` - quick troubleshooting map
- `guides/` - setup and operator-focused walkthroughs
- `examples/payloads/` - copy-pasteable JSON payloads
- `scripts/` - small curl helpers for auth/session flows

## Why Use This

Use this repo when you want to run CoralOS agent workflows reliably through the API, including Coral Cloud as the hosted product surface.

It is especially helpful if you are:

- Building agent workflows where repeatable session startup matters
- Testing marketplace or hosted agents before integrating into a product flow
- Debugging validation errors and needing known-good payload baselines
- Trying to get consistent, UI-visible outputs in Coral Cloud threads

The included skill, examples, and scripts reduce trial-and-error and provide a practical starting point for moving from "it works once" to repeatable execution.

## Fast Path

After installing a skills pack, run the API workflow locally:

1. `export CORAL_API_KEY="your_api_key"`
2. `bash scripts/list_registry_agents.sh`
3. `bash scripts/create_session.sh examples/payloads/echo-session.json`
4. `bash scripts/get_session_state.sh <namespace> <session_id>`

## Debugging Lessons (Concise)

- Docs were close, but first successful run needed extra payload fields.
- Working payloads consistently included:
  - `registrySourceId`
  - `annotations: {}`
  - `execution.runtimeSettings`
  - `extendedEndReport`
- Marketplace and hosted agents worked best when session settings were explicit.
- Most reliable visible output path was instructing agent to write into a session thread.
- Custom-tool webhook outputs appeared constrained by accepted callback hosts (`custom_tools_hostname_fkey` seen repeatedly).

---

<img width="1166" height="367" alt="Screenshot_2026-04-09_at_16 35 39" src="https://github.com/user-attachments/assets/1a060022-e6b2-4f5d-93aa-3e40fa1f62b9" />

