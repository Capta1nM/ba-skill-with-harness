# 0003 Traceability Matrix As Control Panel

Date: 2026-05-11

## Status

Accepted

## Context

Many BA repos keep a traceability matrix as a deliverable artifact: produced
at the end, used to satisfy audit, and then forgotten. That position makes
it the last thing updated and the first thing to drift.

The harness needs a control panel that is updated continuously and that
makes contradictions visible before they reach sign-off.

## Decision

Treat `docs/TRACEABILITY_MATRIX.md` as the operating control panel of the
engagement, not as a deliverable. Every artifact change must update the
matrix in the same change.

The matrix supports three queries:

- Forward trace (need to outcome).
- Backward trace (outcome to need).
- Impact trace (change blast radius).

A row may not have a downstream column at `agreed` while an upstream column
is still `draft`. Agents must surface that contradiction during intake of
any change.

## Alternatives Considered

1. **Matrix as deliverable only.** Rejected: drifts and becomes a fiction.
2. **No matrix; rely on bidirectional links between artifact files.** Hybrid
   accepted: artifact files do carry links, but the matrix provides the
   single overview needed for impact analysis.

## Consequences

Positive:

- Impact analysis is cheap.
- Re-opens are routine, not crises.
- Sign-off conversations have an artifact to point at.

Tradeoffs:

- Every change has matrix overhead. The harness mitigates by making rows
  short and append-only.

## Follow-Up

- If matrix grows unwieldy, consider splitting into per-module sheets while
  keeping a top-level coverage summary.
