---
name: coral-registry
description: Discover and inspect Coral Cloud agents before session creation by listing registry entries and validating agent versions and option schemas.
---

# Coral Registry

Use this skill at design time to discover available agents and inspect metadata before composing a session payload.

## Scope

- List available registry agents.
- Inspect a specific agent by source, name, and version.
- Capture the exact identifiers needed by session creation.

## Live Endpoint Status

- Expected list route: `GET /api/v1/registry`
- Expected inspect route: `GET /api/v1/registry/{source}/{agentName}/{version}`
- Validate in your environment before relying on older helper scripts.

## Fast Command

Run the repo helper first:

- `bash scripts/list_registry_agents.sh`

If helper output returns `{"message":"Not found"}`, update route usage before proceeding to session creation.

## Output Contract

Before moving downstream, record:

- `source`
- `agentName`
- `version`
- notable option requirements and constraints