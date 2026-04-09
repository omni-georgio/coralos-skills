# CoralOS + OpenClaw Setup Guide

This guide is a separate quickstart for running CoralOS workflows with OpenClaw.

## Goal

Use OpenClaw as your local/operator interface while running CoralOS workflows, including Coral Cloud when you need the hosted product environment.

## Prerequisites

- Node.js 18+ and `npm`/`npx`
- CoralOS API key
- Access to Coral Cloud dashboard: [https://coralcloud.ai/dashboard](https://coralcloud.ai/dashboard)
- OpenClaw installed locally

## Step 1: Install Skills CLI

```bash
npx skills
```

## Step 2: Add CoralOS Skills Pack

```bash
npx skills add coralos/skills
```

## Step 3: Configure API Access

```bash
export CORAL_API_KEY="your_api_key"
```

## Step 4: Verify CoralOS Connectivity

From this repo:

```bash
bash scripts/list_registry_agents.sh
```

If this works, your key and API connectivity are valid.

## Step 5: Run a Test Session

```bash
bash scripts/create_session.sh examples/payloads/echo-session.json
```

Then check state:

```bash
bash scripts/get_session_state.sh <namespace> <session_id>
```

## Step 6: Use OpenClaw with CoralOS Workflows

- Point OpenClaw to the same environment where `CORAL_API_KEY` is set.
- Start with the echo payload to validate end-to-end behavior.
- Move to more advanced payloads only after a clean smoke test.

## Troubleshooting

- Validation errors: start from `examples/payloads/echo-session.json` and add fields one at a time.
- Missing output in API response: instruct agents to write to a Coral Cloud thread.
- Custom tool callback issues: check allowed callback host policies.

## Related Docs

- Coral Cloud API guide: [https://docs.coralos.ai/cloud/using-api](https://docs.coralos.ai/cloud/using-api)
- Coral Cloud API reference: [https://docs.coralos.ai/cloud/using-api#coral-cloud-1-page-api-reference](https://docs.coralos.ai/cloud/using-api#coral-cloud-1-page-api-reference)
- Internal payload notes: `../references/payloads.md`
- Internal API notes: `../references/coralos-api-notes.md`

