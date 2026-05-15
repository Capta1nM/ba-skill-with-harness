# Checklist — Traceability Matrix

## Metadata required

- File path: `docs/TRACEABILITY_MATRIX.md`
- Format: markdown table.

## Mỗi row có cột (chuẩn)

| Req ID | Stakeholder | Source Note | Session | Raw Stmt | Module | BRD | SRS/PRD | Story | Wireframe | Status | Evidence |

## Update rule (DoD per change)

- [ ] Update matrix CÙNG commit/lưu với artifact change. Out-of-date
      matrix = defect lớn hơn no matrix.
- [ ] Add row khi: REQ/NFR/CON/ASM mới promote từ raw.
- [ ] Update cột downstream khi: BR/SR/US/SCR mới trace vào.
- [ ] Đổi status row → reflect status thấp nhất trong chain (vd:
      downstream agreed nhưng upstream draft → row status = draft +
      flag contradiction).

## Contradiction detection

- [ ] KHÔNG row nào downstream `agreed` khi upstream `draft`.
- [ ] KHÔNG row nào `signed-off` khi bất kỳ cột nào `draft`.
- [ ] Mọi REQ retired → downstream phải hoặc retired hoặc explicit
      "kept-without-source" (rare, flag).

## Coverage queries (matrix phải support)

1. Forward: REQ → BR → SR → US → SCR (defend stakeholder need reached
   delivery).
2. Backward: SCR → US → SR → BR → REQ → SES → Note → STK (defend
   design decision khi challenge).
3. Impact: "If REQ-042 changes, what moves?" → list downstream cells.

## Anti-patterns

- ❌ Matrix update sau cùng (gộp cuối phase).
- ❌ Delete row thay vì retire (mất audit trail).
- ❌ Re-use ID đã retire.
- ❌ Mark row "agreed" để workflow nhanh nhưng evidence chưa có.
