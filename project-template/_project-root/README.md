# {ENGAGEMENT_NAME}

Business Analysis engagement bootstrapped từ `ba-skill`.

## Start here

1. Đọc `AGENTS.md` — operating rules cho agent + BA.
2. Đọc `docs/WORKFLOW.md` — 6 phase BA.
3. Mở `docs/prompt/ba/template/00-kickoff.md` để bắt đầu Phase 0
   (intake).

## Cấu trúc

```text
{ENGAGEMENT_NAME}/
  AGENTS.md                     master rules cho engagement
  CLAUDE.md                     Claude addendum (skill version, dispatch)
  README.md                     file này
  .project-config.yml           engagement metadata (methodology, name)
  .claude/agents/               12 sub-agent .md per engagement
  docs/                         engagement workspace
    WORKFLOW.md, RISK_LANES.md, ARCHITECTURE.md
    TRACEABILITY_MATRIX.md, QUALITY_GATES.md
    GLOSSARY.md, HARNESS_BACKLOG.md
    decisions/                  ADR log
    memory/                     feedback rules learned in this engagement
    elicitation/                intake, notes, sessions, stakeholders, plan
    requirements/               raw + analyzed
    domain/                     glossary, context map, modules, scope
    brd/                        Business Requirements Document
    srs/  (or prd/)             Spec — depends on methodology
    stories/                    epics + user stories
    wireframes/                 screen specs + assets
    validation/                 crosscheck reports, signoff evidence, CRs
    templates/                  artifact templates (clone khi tạo artifact mới)
    prompt/ba/template/         prompt library 36 file
```

## Quy ước file naming

Đọc `.project-config.yml` mục `artifactIdScheme`.

## Phase status

Tracked ở `.project-config.yml` mục `phaseStatus`. Orchestrator
auto-update khi pass exit gate.

## Status hiện tại

- Phase 0 (intake): chưa bắt đầu.
- Bootstrap date: {BOOTSTRAP_DATE}
- Methodology: {METHODOLOGY}

## Skills required

`ba-skill` installed globally. Verify:

```bash
ls ~/.claude/skills/ | grep ba-
# Expected: ba-architecture, ba-elicitation-prep, ba-elicitation-capture,
# ba-requirement-analysis, ba-domain-modeling, ba-brd, ba-spec, ba-story,
# ba-wireframe, ba-traceability, ba-validation, ba-methodology,
# project-template
```

Missing → cd `<ba-skill repo>` && `bash install.sh`.

## Sub-agents

12 sub-agents tại `.claude/agents/`. Tự copy được khi bootstrap, có thể
fork/tune per engagement nếu context yêu cầu.

## Cần help?

- "Tôi đang ở đâu?" → paste `docs/prompt/ba/template/utility/CHECK-state.md`.
- "Matrix có sync không?" → paste `utility/CHECK-traceability.md`.
- "Tôi vừa nghỉ, resume" → paste `utility/HANDOFF-resume.md`.
- "Agent đi lạc" → paste `utility/STOP-violation.md`.
