# Master Checklist — BA Artifact Quality Gates

Index của mọi checklist DoR/DoD per artifact. Sub-agent đọc checklist
tương ứng artifact mình tạo trước khi đổi status.

## Status flow chuẩn

```text
draft -> review -> agreed -> changed -> retired
                |
                v
              signed-off  (BRD, SRS, PRD only — document-level)
```

- `draft` = author owns, chưa circulate.
- `review` = circulated, đợi feedback. Pass DoR trước khi chuyển sang.
- `agreed` = stakeholder(s) accept. Pass DoD.
- `signed-off` = sponsor sign-off ghi nhận ở `docs/validation/`.
- `changed` = đã agreed, sửa qua Change Request.
- `retired` = không còn in scope.

Một artifact không được nhảy bậc. Không được set downstream `agreed` khi
upstream còn `draft`.

## Per-artifact checklists

| Artifact | Checklist file | Used by skill |
| --- | --- | --- |
| Intake form | [checklist-intake.md](./checklist-intake.md) | `ba-methodology` |
| Stakeholder register | [checklist-stakeholder-register.md](./checklist-stakeholder-register.md) | `ba-elicitation-prep` |
| Elicitation plan | [checklist-elicitation-plan.md](./checklist-elicitation-plan.md) | `ba-elicitation-prep` |
| Interview guide | [checklist-interview-guide.md](./checklist-interview-guide.md) | `ba-elicitation-prep` |
| Workshop agenda | [checklist-workshop-agenda.md](./checklist-workshop-agenda.md) | `ba-elicitation-prep` |
| Raw note (MN/TR/EM/...) | [checklist-note.md](./checklist-note.md) | `ba-elicitation-capture` |
| Session log | [checklist-session-log.md](./checklist-session-log.md) | `ba-elicitation-capture` |
| Raw statement | [checklist-raw-statement.md](./checklist-raw-statement.md) | `ba-elicitation-capture` |
| Analyzed requirement (REQ/NFR/CON/ASM) | [checklist-requirement.md](./checklist-requirement.md) | `ba-requirement-analysis` |
| Glossary entry | [checklist-glossary.md](./checklist-glossary.md) | `ba-domain-modeling` |
| Context map | [checklist-context-map.md](./checklist-context-map.md) | `ba-domain-modeling` |
| Module card | [checklist-module.md](./checklist-module.md) | `ba-domain-modeling` |
| Scope (in/out) | [checklist-scope.md](./checklist-scope.md) | `ba-domain-modeling` |
| BRD | [checklist-brd.md](./checklist-brd.md) | `ba-brd` |
| PRD | [checklist-prd.md](./checklist-prd.md) | `ba-spec` |
| SRS | [checklist-srs.md](./checklist-srs.md) | `ba-spec` |
| Epic | [checklist-epic.md](./checklist-epic.md) | `ba-story` |
| User story | [checklist-user-story.md](./checklist-user-story.md) | `ba-story` |
| Use case | [checklist-use-case.md](./checklist-use-case.md) | `ba-story` |
| Wireframe screen spec | [checklist-wireframe.md](./checklist-wireframe.md) | `ba-wireframe` |
| Traceability matrix | [checklist-traceability.md](./checklist-traceability.md) | `ba-traceability` |
| Validation report | [checklist-validation.md](./checklist-validation.md) | `ba-validation` |
| Change request | [checklist-change-request.md](./checklist-change-request.md) | `ba-validation` |

## Cross-cutting

| Concern | File |
| --- | --- |
| Wiki/docs structure intact | [docs-health-check.md](./docs-health-check.md) |

## Quy ước viết checklist

Mỗi `checklist-<artifact>.md` có cấu trúc:

```md
# Checklist — <Artifact Name>

## Metadata required
- ID prefix:
- Owner field:
- Status field:

## DoR (Definition of Ready — vào status `review`)
- [ ] ...
- [ ] ...

## DoD (Definition of Done — vào status `agreed` / `signed-off`)
- [ ] ...
- [ ] ...

## Trace links bắt buộc
- Upstream:
- Downstream (filled khi propagate):

## Anti-patterns
- ❌ ...
```

Mọi sub-agent đọc checklist file → tick mental box → return status pass/fail
+ list mục fail trong output.
