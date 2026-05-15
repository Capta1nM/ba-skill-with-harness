# Example — Matrix Update Pattern

## Before (after Phase 2)

```markdown
| Req ID | STK | Note | SES | RAW | Module | BRD | SRS | Story | Wireframe | Status | Evidence |
|---|---|---|---|---|---|---|---|---|---|---|---|
| REQ-001 | STK-002a | MN-2026-05-15-coord-a | SES-2026-05-15-coord-a | RAW-001, RAW-008, RAW-015, RAW-023 | MOD-TaskCapture | — | — | — | — | review | — |
| REQ-002 | STK-002a | MN-2026-05-15-coord-a | SES-2026-05-15-coord-a | RAW-002 | MOD-Visibility | — | — | — | — | review | — |
| NFR-001 | STK-001 | MN-2026-05-14-mkt-lead | SES-2026-05-14-mkt-lead | RAW-024 | (cross-cutting) | — | — | — | — | review | — |
```

## Change: BRD signed off

BRD v1.0 signed off với BR-6.1 trace REQ-001, BR-6.2 trace REQ-002,
BR-7.1 (performance NFR) trace NFR-001.

## After matrix update

```markdown
| Req ID | STK | Note | SES | RAW | Module | BRD | SRS | Story | Wireframe | Status | Evidence |
|---|---|---|---|---|---|---|---|---|---|---|---|
| REQ-001 | STK-002a | MN-2026-05-15-coord-a | SES-2026-05-15-coord-a | RAW-001, RAW-008, RAW-015, RAW-023 | MOD-TaskCapture | BR-6.1 | — | — | — | agreed | docs/validation/2026-05-30-signoff-brd.md |
| REQ-002 | STK-002a | MN-2026-05-15-coord-a | SES-2026-05-15-coord-a | RAW-002 | MOD-Visibility | BR-6.2 | — | — | — | agreed | docs/validation/2026-05-30-signoff-brd.md |
| NFR-001 | STK-001 | MN-2026-05-14-mkt-lead | SES-2026-05-14-mkt-lead | RAW-024 | (cross-cutting) | BR-7.1 | — | — | — | agreed | docs/validation/2026-05-30-signoff-brd.md |
```

## Change: Phase 5 story US-001 drafted

US-001 trace SR-4.1.1 trace BR-6.1.

## After matrix update

```markdown
| REQ-001 | STK-002a | MN-... | SES-... | RAW-001, RAW-008, RAW-015, RAW-023 | MOD-TaskCapture | BR-6.1 | SR-4.1.1 | US-001 | — | review | (US-001 draft, lowest in chain) |
```

Status row = `review` vì US-001 đang `review` (lowest in chain ≥ draft).

## Contradiction example

Tại 1 thời điểm:

```markdown
| REQ-005 | STK-001 | MN-... | SES-... | RAW-018 | MOD-TaskCapture | BR-6.3 | SR-4.2.1 | US-008 | — | ??? | ??? |
```

Status:
- REQ-005: draft (chưa stakeholder confirm)
- BR-6.3: signed-off (BRD đã sign-off)
- SR-4.2.1: agreed
- US-008: agreed

→ Contradiction. BRD section signed-off mà REQ source vẫn draft? Nghĩa là
BRD ship trước khi REQ confirm.

Fix options:
1. Promote REQ-005 review → agreed (nếu stakeholder confirm thực ra OK).
2. Demote BR-6.3 → review pending REQ confirm.
3. Open Change Request nếu REQ thực sự không nên signed-off.

KHÔNG thể "ignore" contradiction.

## Anti-example

❌ Bad update workflow:

BA viết US-001, signed-off BRD nhưng quên update matrix. 2 tuần sau,
PM hỏi "BR-6.1 cover by story nào?" → BA phải đi tìm — mất 1h, lúc đó
US-001 đã đổi 3 phiên bản, BA confuse phiên bản nào trace.

→ Update matrix cùng commit. Đó là thói quen, không phải "khi nào rảnh".
