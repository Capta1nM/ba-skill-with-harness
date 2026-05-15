---
name: ba-traceability
description: Cross-cutting skill. Maintain TRACEABILITY_MATRIX.md là control panel của engagement. Update CÙNG commit với artifact change. Detect contradiction (downstream agreed + upstream draft).
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-traceability — Cross-Cutting Skill

## Cardinal Rule

**Update matrix cùng commit/lưu với artifact change.** Matrix
out-of-date = defect lớn hơn no matrix.

## Matrix schema

File: `docs/TRACEABILITY_MATRIX.md`

```text
| Req ID | Stakeholder | Source Note | Session | Raw Stmt | Module | BRD | SRS/PRD | Story | Wireframe | Status | Evidence |
```

| Cột | Filled khi |
| --- | --- |
| Req ID | REQ promote từ raw |
| Stakeholder | RAW source có STK ID |
| Source Note | RAW có source note MN/TR/EM/... |
| Session | RAW capture qua session formal |
| Raw Stmt | RAW ID |
| Module | REQ assigned module |
| BRD | BR-X.X trace vào REQ |
| SRS/PRD | SR-X.X.X hoặc CAP-XX trace vào BR |
| Story | US-XXX hoặc UC-XXX trace vào SR/CAP |
| Wireframe | SCR-XXX serve US/UC |
| Status | min status của chain (downstream draft → row draft) |
| Evidence | link tới validation report ở `docs/validation/` |

## Workflow per artifact change

```text
1. Artifact <X> changes (created / status updated / retired)
        |
        v
2. Identify affected matrix row(s)
        |
        v
3. Update cell(s) phản ánh change
        - Add new row nếu REQ mới promote.
        - Update downstream cell nếu BR/SR/US/SCR trace mới.
        - Update Status nếu artifact đổi status.
        |
        v
4. Run contradiction detection
        - downstream agreed + upstream draft? → FLAG, đề xuất fix.
        - downstream signed-off + upstream draft? → BLOCK.
        |
        v
5. Return summary: rows added/updated, contradictions found
```

## 3 query types matrix phải support

1. **Forward trace** (need → outcome): `REQ-042 → BR-5.2 → SR-4.3.1 →
   US-014 → SCR-Login`. Defend stakeholder need reached delivery.
2. **Backward trace** (outcome → need): start from SCR or US, walk
   ngược lên đến STK + Note. Defend design decision khi challenge.
3. **Impact trace** (artifact → dependents): "If REQ-042 changes, what
   moves?" → list downstream cells của row REQ-042.

## Contradiction patterns

| Pattern | Severity | Action |
| --- | --- | --- |
| Downstream `agreed` + upstream `draft` | major | Flag, đề xuất hoặc demote downstream hoặc promote upstream |
| Downstream `signed-off` + upstream `draft` | block | Engagement integrity broken. Pause. |
| REQ retired + downstream still has trace | major | Retire downstream hoặc explicit "kept-without-source" + reason |
| Cell mention ID không tồn tại trên đĩa | block | ID typo hoặc artifact đã xóa. Fix. |
| Row có status `agreed` nhưng evidence column rỗng | major | Add evidence file path hoặc demote status |

## Update rules

- **Add row** khi: REQ/NFR/CON/ASM promote từ raw lần đầu.
- **Update cell** khi: BR/SR/US/SCR trace mới.
- **Update Status** khi: artifact change status (draft → review →
  agreed → signed-off → changed → retired).
- **Retire row** thay vì xóa: giữ audit trail. Status → retired.
- **KHÔNG re-use ID** retired.

## Output format

```text
[Matrix Update]
Rows added: REQ-042 (status: draft).
Rows updated: 
  - REQ-001: BRD column BR-6.1, Story column US-001.
  - REQ-008: status draft → review.
Contradictions found:
  - REQ-005: Story US-008 marked agreed but REQ-005 still draft. 
    Suggest: promote REQ-005 review → agreed OR demote US-008.
Total: 1 add, 2 updates, 1 contradiction flag.
```

## Anti-patterns

- ❌ Matrix update sau cùng (gộp cuối phase).
- ❌ Delete row thay vì retire.
- ❌ Re-use retired ID.
- ❌ Skip contradiction detection.
- ❌ Mark agreed mà evidence rỗng.
- ❌ Matrix split nhiều file (1 file canonical).
