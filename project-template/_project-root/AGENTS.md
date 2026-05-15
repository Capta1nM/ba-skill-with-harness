# Agent Operating Guide — {ENGAGEMENT_NAME}

This is engagement `{ENGAGEMENT_NAME}` bootstrapped from `ba-skill`.

Skill library lives globally at `~/.claude/skills/ba-*`. Sub-agents live
per-engagement at `.claude/agents/`. Engagement workspace lives at
`docs/`.

The app/product is what end-users touch. The harness is what BAs and
agents touch.

## Source Of Truth (read in order)

1. `.project-config.yml` — engagement metadata (methodology, name).
2. `AGENTS.md` (this file) — project-wide master rules.
3. `CLAUDE.md` — Claude-specific addendum.
4. `docs/RISK_LANES.md` — intake gate.
5. `docs/WORKFLOW.md` — 6 phase BA workflow.
6. `docs/ARCHITECTURE.md` — artifact dependency rules.
7. `docs/TRACEABILITY_MATRIX.md` — current state of engagement.
8. `docs/QUALITY_GATES.md` — DoR/DoD slim (full ở skills).
9. `docs/memory/MEMORY.md` — feedback rules learned.
10. `docs/GLOSSARY.md` — engagement-specific terms.
11. `~/.claude/skills/ba-architecture/skill.md` — orchestrator rules.
12. `~/.claude/skills/ba-architecture/checklist/ba-checklist.md` — master.
13. `~/.claude/skills/ba-<concern>/skill.md` — per-concern rules.
14. `.claude/agents/<name>.md` — sub-agent specs (per-engagement).

## Task Loop

For every task:

1. Classify input via `docs/RISK_LANES.md` + `~/.claude/skills/ba-architecture`.
2. Identify phase (P0 intake / P1-P6 / harness-improvement).
3. Locate affected artifacts via `docs/TRACEABILITY_MATRIX.md`.
4. Dispatch sub-agent qua Agent tool (per Dispatch Table in
   `ba-architecture/skill.md`).
5. Apply Quality Gate before status advance.
6. Update matrix in same change.
7. Capture friction → `docs/HARNESS_BACKLOG.md` hoặc `docs/memory/`.

## Cardinal Rules

1. **No requirement without a source.** REQ → RAW → SES → Note chain
   must be complete.
2. **No artifact without traceability.** Every BR/SR/CAP/US/UC/SCR
   trace ≥1 upstream parent.
3. **No wireframe ahead of its SRS.** Status `agreed` requires
   cross-check pass.
4. **Ask before SRS vs PRD vs US.** Phase 5 entry needs methodology ADR
   logged.
5. **Glossary owns names.** Reconcile collisions before propagate.
6. **State on disk, not in chat.** Persist every clarifying answer
   before next turn.
7. **Dump first, structure later.** Raw note → `docs/elicitation/notes/`
   ngay (5 phút). Structure (session log + RAW) sau.

## Harness Change Policy

Agents may update directly:

- Artifact status (draft → review → agreed) when gate passes.
- `docs/TRACEABILITY_MATRIX.md` rows.
- Links between artifacts.
- Validation cross-check notes.
- Small clarifications tied to current task.

Agents should ask for human confirmation before:

- Closing/removing artifact with downstream dependencies.
- Changing scope after sponsor walkthrough.
- Changing methodology shape (`.project-config.yml`).
- Skipping a phase exit gate.
- Replacing source-of-truth order.

## Done Definition

A task is done only when:

- Requested change completed or blocker documented.
- Quality Gate applied for affected artifact.
- `docs/TRACEABILITY_MATRIX.md` reflects new state.
- Cross-checks pass or divergence logged as open issue.
- Missing harness capability added to `docs/HARNESS_BACKLOG.md`.
- Final response says what changed, what was confirmed, what was not
  attempted.

## When something feels off

Use prompt `docs/prompt/ba/template/utility/STOP-violation.md` to pull
agent back to harness rules.

Use prompt `utility/CHECK-state.md` to verify "where are we now".

Use prompt `utility/HANDOFF-resume.md` when opening new session after
break.
