# Per-Engagement Agents

12 sub-agent .md được bootstrap copy vào `<engagement>/.claude/agents/`
khi tạo engagement mới. Mỗi agent có thể fork/tune per-engagement nếu
context yêu cầu (vd: glossary đặc thù, methodology setting).

## Dispatch model

Main agent (Claude Code session) gọi `ba-architecture` orchestrator
skill. Orchestrator dispatch sub-agent qua `Agent` tool dựa theo input
signal (xem `ba-architecture/skill.md` Dispatch Table).

Sub-agent đọc:
- Engagement state (`docs/`).
- Skill global (`~/.claude/skills/ba-*`).
- Per-engagement override (chính file agent này).

Trả về structured output cho orchestrator aggregate.

## 12 agents

| Agent | Phase | Primary skill |
| --- | --- | --- |
| ba-intake-classifier | Intake | ba-methodology + ba-architecture |
| ba-elicitation-prep-builder | P1 | ba-elicitation-prep |
| ba-session-capturer | P2 capture | ba-elicitation-capture |
| ba-requirement-analyst | P2 analyze | ba-requirement-analysis + ba-traceability |
| ba-domain-modeler | P3 | ba-domain-modeling + ba-traceability |
| ba-brd-writer | P4 | ba-brd + ba-traceability |
| ba-spec-writer | P5 spec | ba-spec + ba-traceability |
| ba-story-writer | P5 stories | ba-story + ba-traceability |
| ba-wireframe-architect | P6 | ba-wireframe + ba-validation |
| ba-traceability-keeper | all | ba-traceability |
| ba-validator | all | ba-validation |
| ba-wiki-health-checker | all | (uses docs-health-check.md) |

## Placeholder convention

Mỗi agent .md có `{ENGAGEMENT_NAME}` và `{METHODOLOGY}` placeholder.
Bootstrap script substitute khi copy vào engagement.

Agent có thể tham chiếu:
- `${WIKI_PATH}` = `<engagement>/docs/`
- `${SKILLS_PATH}` = `~/.claude/skills/`

## Context Inheritance (bắt buộc)

Khi orchestrator (`ba-architecture` skill) dispatch sub-agent qua Agent
tool, BẮT BUỘC pass `engagementContext` block (xem
`~/.claude/skills/ba-architecture/skill.md` mục "Engagement Context
Inheritance"). Sub-agent đọc từ engagementContext, KHÔNG re-discover.

## File Write Boundary

Mỗi sub-agent CHỈ được write/edit file thuộc ownership matrix (xem
`~/.claude/skills/ba-architecture/skill.md` mục "File Write Ownership
Matrix").

Sub-agent CẤM tự write:
- `.project-config.yml` → orchestrator owns.
- `docs/decisions/<NNNN>-*.md` → orchestrator owns. Sub-agent return
  `adr_proposed: <draft>` trong output.
- `docs/memory/MEMORY.md` → orchestrator owns. Sub-agent return
  `memory_proposed: <draft>` nếu cần.
- `docs/HARNESS_BACKLOG.md` → orchestrator owns. Sub-agent return
  `harness_friction: <list>` nếu cần.
- File thuộc agent khác (cross-pollution = defect).

Vi phạm boundary → orchestrator phát hiện qua aggregate output →
rollback + re-dispatch đúng owner.

## Convention frontmatter

```yaml
---
name: ba-<name>
description: <what it does + when to dispatch>
tools: Read, Write, Edit, Glob, Grep, Bash, AskUserQuestion
model: sonnet
---
```

Model = sonnet mặc định. Tasks phức tạp (review BRD, complex
crosscheck) override `model: opus` per-engagement nếu cần.

## Standard Output Schema (mọi sub-agent BẮT BUỘC inherit)

Mọi sub-agent's output, ngoài agent-specific fields, BẮT BUỘC trả về
các field protocol sau (để orchestrator handle ADR/Memory/Backlog
write):

```yaml
# Standard fields (BẮT BUỘC — inherit by all)
status: <success | needs-confirm | blocked | gate-fail>
warnings: []                    # blockers, mâu thuẫn, scope creep ngầm, NFR không đo được, ...
matrix_rows_updated: <int>      # số rows agent vừa update trong TRACEABILITY_MATRIX
next_action: <description>      # đề xuất cho orchestrator

# Protocol proposals (BẮT BUỘC trả về nếu detected, none nếu không có)
adr_proposed: <none | { type, title, context, decision, alternatives, consequences, affected_artifacts }>
memory_proposed: []             # list of { type, trigger, rule, why, how_to_apply, affected, source }
harness_friction: []            # list of { title, discovered_while, pain, suggestion, risk }

# Agent-specific fields (declared trong từng agent.md)
<...>
```

### Trigger để return mỗi protocol field

| Field | Trigger | Orchestrator action |
| --- | --- | --- |
| `warnings` | Bất kỳ blocker / contradiction / scope creep detect | Surface lên user, có thể pause |
| `adr_proposed` | Decision có scope/methodology/glossary-collision impact ≥1 module / NFR threshold deviate | Orchestrator AskUserQuestion confirm → write ADR |
| `memory_proposed` | Friction lặp ≥2 lần or user "ghi nhớ" or pattern confirmed | Orchestrator AskUserQuestion → append MEMORY |
| `harness_friction` | Template thiếu trường / dispatch sai / prompt missing task type / recurring failure | Orchestrator AskUserQuestion → append HARNESS_BACKLOG |
| `matrix_rows_updated` | Sub-agent update local matrix rows trong cùng change | Orchestrator audit qua aggregate; dispatch ba-traceability-keeper full-audit periodically |

### Khi return `none` / `[]`

- Always include the field key, value = `none` (cho object) hoặc `[]`
  (cho list). KHÔNG omit key.
- Orchestrator skip processing nếu value rỗng.
- Format này cho phép orchestrator parse output reliably.

### Vi phạm = defect

Sub-agent KHÔNG return standard fields → orchestrator coi như defect:
- Re-dispatch với prompt nhắc nhở.
- Log harness friction (recurring → fix agent .md).
