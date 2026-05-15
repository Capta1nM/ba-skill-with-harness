# Example — Promote RAW → REQ

## Input: 4 RAW statements

```text
RAW-001 (STK-002a, MN-2026-05-15-coord-a):
  "Tao copy task từ email vô spreadsheet, đôi khi miss từ Slack."

RAW-008 (STK-002b, MN-2026-05-16-coord-b):
  "Tasks thường đến trong email, nhưng đôi lúc cũng có trong chat."

RAW-015 (STK-002c, MN-2026-05-17-coord-c):
  "Tao note vào sticky note rồi mới đưa vào sheet."

RAW-023 (STK-001, MN-2026-05-14-mkt-lead):
  "Mình muốn thứ gì tự động hơn."
```

## Analysis

3 coordinator cùng nói về: **capture task vào 1 nơi**. Sponsor xác
nhận need.

RAW-001 + RAW-008 + RAW-015 + RAW-023 → 1 REQ.

## Proposed REQ (chưa ghi file, trình user)

| REQ-ID dự kiến | Type | Module | Statement | Source RAWs | Priority | Câu hỏi cần làm rõ | Mâu thuẫn |
| --- | --- | --- | --- | --- | --- | --- | --- |
| REQ-001 | Functional | MOD-TaskCapture | The system shall let coordinators create a task with required fields (title, owner, campaign, phase, due date). | RAW-001, RAW-008, RAW-015, RAW-023 | must | Có support import tự động từ email/Slack v1? (RAW-001/008 hint nhưng RAW-023 chỉ nói "tự động hơn" chung chung) | None |

## After user confirm

User said: "v1 chỉ manual capture, defer email/Slack import sang v2.
Sponsor đã agree."

→ Tạo file:

```markdown
# REQ-001

## Metadata

- ID: REQ-001
- Type: functional
- Module: MOD-TaskCapture
- Priority: must
- Status: draft → review (sau khi user confirm xong proposal table)
- Owner: BA1

## Source

| Raw ID | Session | Note | Stakeholder | Date |
| RAW-001 | SES-2026-05-15-coord-a | MN-2026-05-15-coord-a | STK-002a | 2026-05-15 |
| RAW-008 | SES-2026-05-16-coord-b | MN-2026-05-16-coord-b | STK-002b | 2026-05-16 |
| RAW-015 | SES-2026-05-17-coord-c | MN-2026-05-17-coord-c | STK-002c | 2026-05-17 |
| RAW-023 | SES-2026-05-14-mkt-lead | MN-2026-05-14-mkt-lead | STK-001 | 2026-05-14 |

## Statement

The system shall let a coordinator create a campaign task with required
fields title, owner, campaign reference, phase, and due date.

## Rationale

> "Tao copy task từ email vô spreadsheet, đôi khi miss." — STK-002a
> "Mình muốn thứ gì tự động hơn." — STK-001 (sponsor)

3 coordinator cùng confirm capture là pain point hàng đầu.

## Acceptance Conditions

- Given a logged-in coordinator, when they submit a task with title,
  owner, campaign, phase, due date, then the task is saved and visible
  in team backlog within 2 seconds.
- Given a missing title, when they submit, then the system rejects
  with "Title is required".

## Dependencies

- Depends on: REQ-005 (campaign concept exists).
- Blocks: nothing.

## Glossary Terms Used

- Campaign (docs/domain/glossary.md)
- Phase (docs/domain/glossary.md)
- Owner

## Open Questions

- Email/Slack import: deferred to v2 per sponsor.

## Downstream Trace (sẽ filled)

- BRD: BR-6.1.
- SRS clause: SR-4.1.1.
- User stories: US-001.
- Wireframes: SCR-TaskCreate.

## History

- 2026-05-21: created from RAW-001, RAW-008, RAW-015, RAW-023.
```

## Vì sao tốt

- 4 RAW → 1 REQ atomic (capture là 1 need).
- Source chain đầy đủ: REQ → RAW → SES → Note → STK.
- AC dạng Given/When/Then testable.
- Glossary terms reference rõ.
- Open question (email/Slack) resolved bằng deferral, không bị quên.

## Anti-example

❌ Bad promotion:

```text
REQ-001 (bịa):
  The system shall create a task and automatically import from email
  and Slack and assign to owner and notify.
```

Lỗi:
- And-join 4 behavior độc lập → atomic violation.
- "Automatically import email/Slack" — RAW-023 chỉ nói "tự động hơn",
  không nói email/Slack. Đây là BA inferred mà không flag ASM.
- "Notify owner" — không RAW nào nói. Bịa.
- Sponsor đã defer email/Slack v2 → vi phạm.

→ Phải back to user, không tự fix.
