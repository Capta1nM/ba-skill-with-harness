# 0002 Six-Phase BA Loop

Date: 2026-05-11

## Status

Accepted

## Context

A BA workflow can be modeled at many granularities: two phases (discover,
specify), four (elicit, analyze, specify, validate), or many more. The
chosen granularity must be coarse enough to plan against and fine enough to
catch the most common defects:

- Elicitation skipped or front-loaded onto one stakeholder.
- BRD written before scope is agreed.
- SRS written before BRD is signed.
- Wireframes drawn before stories exist.
- Cross-checks deferred to post-delivery.

## Decision

Model the BA workflow as six phases:

1. **Elicitation Preparation** — plan, register, guides, agendas.
2. **Elicitation Execution** — sessions and raw capture.
3. **Domain Mapping & Scope** — glossary, context map, modules, scope.
4. **BRD** — signed business contract.
5. **SRS / PRD + User Stories** — buildable specification, shape chosen per
   engagement.
6. **Wireframes** — screen specs cross-checked against SRS.

Phases are gated, not strictly sequential. Re-opens are allowed via change
request.

## Alternatives Considered

1. **Four phases (Elicit / Analyze / Specify / Validate).** Rejected:
   collapses preparation and execution, which have different exit gates;
   collapses BRD and SRS, which have different audiences and sign-off
   semantics.
2. **Twelve fine-grained phases (BABOK-style).** Rejected: too heavy for
   most engagements, and most fine-grained phases share the same
   artifact-quality concerns the six-phase model already captures.
3. **Three phases (Discovery / Specification / Delivery).** Rejected: makes
   it too easy to skip wireframe cross-check.

## Consequences

Positive:

- Each phase has a clear exit gate.
- Re-opens are explicit and traceable.
- Methodology choices (SRS vs PRD vs US-only) are isolated to Phase 5 only.

Tradeoffs:

- Six phases is more than many small engagements ask for; tiny engagements
  may collapse Phases 1+2 in practice but should still log session evidence.

## Follow-Up

- Track whether Phase 1 and Phase 2 ever need to merge for very small
  engagements; if so, document a "lite" variant.
