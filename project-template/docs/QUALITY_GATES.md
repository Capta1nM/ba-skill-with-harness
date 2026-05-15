# Quality Gates — {ENGAGEMENT_NAME}

Slim reference. Full checklist per artifact ở
`~/.claude/skills/ba-architecture/checklist/`.

## Status flow chuẩn

```text
draft -> review -> agreed -> changed -> retired
                |
                v
              signed-off  (BRD, SRS, PRD only)
```

Mỗi artifact không nhảy bậc. Downstream `agreed` chỉ khi upstream
`agreed` hoặc `signed-off`.

## Quick reference

| Artifact | Full checklist | Trigger phase |
| --- | --- | --- |
| Intake form | `~/.claude/skills/ba-architecture/checklist/checklist-intake.md` | P0 |
| Stakeholder register | `~/.claude/skills/ba-architecture/checklist/checklist-stakeholder-register.md` | P1 |
| Elicitation plan | `checklist-elicitation-plan.md` | P1 |
| Interview guide | `checklist-interview-guide.md` | P1 |
| Workshop agenda | `checklist-workshop-agenda.md` | P1 |
| Raw note | `checklist-note.md` | P2 |
| Session log | `checklist-session-log.md` | P2 |
| Raw statement | `checklist-raw-statement.md` | P2 |
| Analyzed requirement | `checklist-requirement.md` | P2 |
| Glossary entry | `checklist-glossary.md` | P3 |
| Context map | `checklist-context-map.md` | P3 |
| Module card | `checklist-module.md` | P3 |
| Scope | `checklist-scope.md` | P3 |
| BRD | `checklist-brd.md` | P4 |
| PRD | `checklist-prd.md` | P5 |
| SRS | `checklist-srs.md` | P5 |
| Epic | `checklist-epic.md` | P5 |
| User story | `checklist-user-story.md` | P5 |
| Use case | `checklist-use-case.md` | P5 |
| Wireframe screen | `checklist-wireframe.md` | P6 |
| Traceability matrix | `checklist-traceability.md` | all |
| Validation report | `checklist-validation.md` | all |
| Change request | `checklist-change-request.md` | all |
| Docs structure | `docs-health-check.md` | all |

## Cardinal Rules (kế thừa từ ba-architecture)

1. No requirement without a source.
2. No artifact without traceability.
3. No wireframe ahead of its SRS.
4. Ask before SRS vs PRD vs US.
5. Glossary owns names.
6. State on disk, not in chat.
7. Dump first, structure later.

## Engagement-specific overrides

(Empty by default. Add per-engagement rules below.)

- (none yet)
