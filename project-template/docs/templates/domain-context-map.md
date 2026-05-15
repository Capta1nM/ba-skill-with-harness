# Domain Context Map

Save as `docs/domain/context-map.md`.

## Metadata

- Owner:
- Status: draft | review | agreed
- Last reviewed:

## Purpose

Explain what this map is for and who reads it.

## Actors

External actors (people, roles, systems) that interact with the scope under
analysis.

| Actor | Type (human / system) | Role | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

## Bounded Contexts / Modules

```text
+-----------------+         +-----------------+
|  Module A       |  --->   |  Module B       |
|  (purpose)      |         |  (purpose)      |
+-----------------+         +-----------------+
        |                            |
        v                            v
+-----------------+         +-----------------+
|  External X     |         |  Module C       |
+-----------------+         +-----------------+
```

Replace with the real diagram (markdown ASCII, mermaid, or link to an image
under `domain/`).

## Key Flows

For each headline business flow, list the steps and which module owns each
step.

| Flow | Step | Owner module | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

## Integration Points

| Source | Target | Direction | Data | Trigger | Mode (sync/async) |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Language Boundaries

Where the same term means different things in different contexts, name the
contexts.

| Term | Context A meaning | Context B meaning |
| --- | --- | --- |
|  |  |  |

## Out Of Scope (for the map, not the project)

- Item that is intentionally not modeled and why.

## History

- YYYY-MM-DD: created.
