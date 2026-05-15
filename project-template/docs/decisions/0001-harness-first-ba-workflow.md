# 0001 Harness-First BA Workflow

Date: 2026-05-11

## Status

Accepted

## Context

Business Analysis output is highly variable across engagements: some
projects ship a 60-page IEEE SRS, others ship only user stories, others
center on a PRD plus wireframes. Across all shapes, the recurring failures
are the same:

- Requirements without sourced stakeholder statements.
- BRD sign-off followed by silent downstream divergence.
- Wireframes that introduce invisible scope.
- Glossary drift between teams.
- Lost traceability when a phase is re-opened.

These failures do not come from missing templates. They come from a missing
operating model that says: every artifact has an upstream parent, a quality
gate, and a traceable place in a control panel.

Adding AI agents to BA work amplifies both the productivity and the
failure modes: agents draft fast and confidently, so unsourced or
inconsistent artifacts proliferate unless the repository enforces discipline.

## Decision

Adopt a harness-first model for BA work. The repository ships with:

- An agent operating guide (`AGENTS.md`).
- A six-phase workflow (`docs/WORKFLOW.md`) covering elicitation prep,
  elicitation execution, domain mapping, BRD, SRS/PRD + stories, and
  wireframes.
- An intake gate (`docs/INTAKE.md`) that classifies every prompt by phase
  and lane.
- An information architecture document (`docs/ARCHITECTURE.md`) defining how
  artifacts derive from each other.
- A traceability matrix (`docs/TRACEABILITY_MATRIX.md`) as the control
  panel.
- Quality gates per artifact (`docs/QUALITY_GATES.md`).
- A reusable template set (`docs/templates/`).
- A decision log and harness backlog.

No project-specific BRD, SRS, or PRD is shipped. The harness waits for an
engagement.

## Alternatives Considered

1. **Project template per industry (banking, retail, healthcare).** Rejected:
   industries differ less than stakeholder maturity and methodology choices
   do; templates would force a shape too early.
2. **Single canonical artifact pack (always SRS + US + wireframes).**
   Rejected: this overspecifies. Some engagements legitimately ship without
   SRS; the harness should support that with a recorded decision.
3. **No phase model; every artifact is independent.** Rejected: removes the
   sequencing and gating that prevent silent downstream divergence.

## Consequences

Positive:

- The harness is reusable across engagements regardless of methodology.
- Agents have a clear operating model that prevents the most common BA
  failure modes.
- Re-opens are cheap because the matrix preserves linkage.

Tradeoffs:

- More ceremony than a freeform BA workflow. Tiny edits still touch
  traceability.
- BAs new to the harness need orientation time.

## Follow-Up

- Build the question bank with reusable elicitation questions over time.
- Capture recurring engagement shapes (e.g. "SaaS internal tool", "regulated
  workflow") as starter decision packs in future versions.
