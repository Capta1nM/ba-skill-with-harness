---
name: ba-elicitation-prep
description: Phase 1 skill. Build stakeholder register, elicitation plan, interview guides, workshop agendas. Pull questions từ question bank. Self-check anti-patterns trước khi finalize.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-elicitation-prep — Phase 1 Skill

## Mục đích

Reach Phase 2 với plan tối đa hóa signal per stakeholder hour.

## Artifacts produced

| Artifact | Template | Checklist |
| --- | --- | --- |
| Stakeholder register | `docs/templates/stakeholder-register.md` | checklist-stakeholder-register.md |
| Elicitation plan | `docs/templates/elicitation-plan.md` | checklist-elicitation-plan.md |
| Interview guide | `docs/templates/interview-guide.md` | checklist-interview-guide.md |
| Workshop agenda | `docs/templates/workshop-agenda.md` | checklist-workshop-agenda.md |

## Workflow

```text
1. Read intake form + check Clarifying Q&A đã filled
        |
        v
2. Propose stakeholder register (KHÔNG ghi file, trình bảng đề xuất)
        |
        v (đợi user confirm)
3. Write stakeholders.md + pass checklist-stakeholder-register
        |
        v
4. Propose elicitation plan (technique + schedule + risks)
        |
        v (đợi user confirm)
5. Write plan.md + pass checklist-elicitation-plan
        |
        v
6. For each interview role / workshop topic:
        propose questions from question-bank.md + role-specific deep-dive
        self-check anti-pattern
        |
        v (đợi user confirm)
7. Write guide / agenda + pass respective checklist
        |
        v
8. Check exit gate P1
```

## Question bank usage

Question bank ở `docs/templates/question-bank.md`. Categories:

- Context & Goal
- Current State
- Pain & Friction
- Future State & Vision
- Stakeholders & Influence
- Constraints
- Volume & Frequency
- Exception Handling
- Non-Functional
- Integration
- Success & Measurement
- Risk Surfacing
- Closing

Mỗi interview guide nên pull ≥1 câu từ ≥3 category. Discovery section
bắt buộc open-ended.

Question bank gặp gap (category thiếu) → đề xuất add vào
HARNESS_BACKLOG.md, không tự sửa global template.

## Stakeholder ID scheme

- `STK-001..099` = primary stakeholders.
- `STK-101..199` = secondary stakeholders.
- `STK-201..299` = excluded groups (vẫn ID hóa để traceability).

## Capacity reality

Plan KHÔNG quá 3 session / tuần / 1 BA. Vượt → flag risk, đề xuất:

- Tăng BA capacity.
- Split scope (Phase 1A, Phase 1B).
- Hoãn timeline.

## Anti-patterns

- ❌ Designing questions around BA assumed solution.
- ❌ Skipping secondary stakeholders (compliance, ops, support, legal).
- ❌ First interview = elicitation plan.
- ❌ Workshop > 2.5h liên tục.
- ❌ Interview guide không có anti-pattern self-check.
