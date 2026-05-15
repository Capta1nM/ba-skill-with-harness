# Example — Change Request Flow

## Trigger

Phase 6 cross-check phát hiện SCR-Backlog có column "Priority" mà SR/REQ
không nhắc.

3 options:
1. Add REQ mới (CR)
2. Remove khỏi wireframe
3. Map vào REQ hiện có

Sponsor confirm: priority là feature đáng có. → Option 1 (CR).

## CR file

```markdown
# docs/validation/changesets/CR-2026-06-12-001.md

## Metadata

- ID: CR-2026-06-12-001
- Status: proposed
- Triggered by: cross-check 2026-06-12 (finding F-1)
- Affected phase: re-open Phase 2 (add REQ) + Phase 5 (add SR + US)
- Owner: BA1
- Requested approval: STK-001 (sponsor)

## Trigger source

Phase 6 crosscheck report `docs/validation/2026-06-12-crosscheck-wireframes.md`
finding F-1:

> SCR-Backlog has column "Priority" but no SR clause defines task
> priority field.

## Why this change

Sponsor confirmed task priority is valuable for Marketing Lead to spot
critical tasks early. Not v2 — should be v1 since wireframe already
mocked it.

## Affected artifacts

| Artifact | Cur status | Proposed change |
| --- | --- | --- |
| REQ-012 (new) | — | Add new REQ "Task has priority field (high/medium/low)" |
| BR-6.1 | signed-off | Add reference to REQ-012 in source REQs list |
| SR-4.1.5 (new) | — | Add new SR "Task priority field with values high/medium/low, default medium" |
| US-014 (new) | — | New story "As coordinator, set priority on task" |
| SCR-Backlog | review | Keep Priority column, add filter |
| SCR-TaskCreate | review | Add priority dropdown |
| TRACEABILITY_MATRIX | — | Add row REQ-012, update BR-6.1, add SR-4.1.5, US-014 |

## Impact analysis

- Phase 4 BRD: BR-6.1 đã signed-off. CR re-opens BR-6.1 source list
  (minor edit, not body change). Sponsor re-confirm.
- Phase 5 SRS: SR-4.1.5 mới. Tech lead review needed.
- Phase 5 Stories: US-014 mới. Product owner review needed.
- Phase 6 Wireframes: SCR-Backlog + SCR-TaskCreate update.
- Estimated effort: 1 BA-day + 1 tech-lead-half-day + 1 sprint dev.

## Stakeholders re-notify

- STK-001 (sponsor) — approve CR + re-sign BR-6.1 source list.
- STK-002a/b/c (coordinators) — confirm priority levels (high/medium/low) match their model.
- Tech lead — confirm SR-4.1.5 buildable.
- Product owner — confirm US-014 priority + DoR.

## Open issues

- Default priority value? (proposed: medium)
- Can priority change after task created? (proposed: yes, audit logged)
→ Resolve in stakeholder follow-up before CR approval.

## Decision needed for ADR

KHÔNG — scope không thay đổi, methodology không thay đổi. Đây là feature
addition trong scope.

## History

- 2026-06-12: proposed by BA1.
```

## After sponsor approval

```markdown
## History

- 2026-06-12: proposed by BA1.
- 2026-06-13: approved by STK-001 (verbal in 1:1, confirmed via email
  thread linked in evidence).
- 2026-06-14: applied — all artifacts updated, matrix synced.
- 2026-06-14: stakeholders re-notified via Slack #marketing-task-tool.

Status: applied.
```

## Vì sao tốt

- Trigger source rõ (link cross-check report).
- Impact analysis chi tiết.
- Stakeholders re-notify list explicit.
- Open issues resolved trước khi apply.
- No ADR needed because scope/methodology unchanged — đúng phán đoán.

## Anti-example

❌ Silent change: BA tự thêm REQ-012 + SR + US + update wireframe mà
không CR.

Hậu quả:
- Sponsor không biết BR-6.1 source list đã đổi.
- Tech lead không review SR-4.1.5 → có thể không build được như spec.
- 1 tháng sau audit hỏi: "Priority field có khi nào được approve?" → không
  trả lời được.

→ CR luôn explicit. Friction nhỏ giờ, an toàn lớn sau.
