# Example — Meeting Note (MN-)

```markdown
# MN-2026-05-14-mkt-lead-1on1

## Metadata

- ID: MN-2026-05-14-mkt-lead-1on1
- Type: meeting
- Event date: 2026-05-14
- Captured date: 2026-05-14
- Captured by: BA1
- Status: captured
- Stakeholders involved: STK-001 (Sarah Chen, Mktg Lead)
- Related plan session: SES-2026-05-14-mkt-lead
- Source file(s): manual dump, no source file (1:1 không record)

## Context

1:1 30min với Sarah. Mục đích: confirm scope engagement.

## Raw Content

> "Tụi mình mất khoảng 30% deadline mỗi tháng. Sếp lớn đang hỏi sao."
  #need #scope-in

> "Spreadsheet thì có rồi nhưng không ai update đều. Mình muốn thứ gì
  tự động hơn." #scope-in

> "Phase report cuối tháng cho boss thì tụi mình OK tạm. Đừng làm
  reporting dashboard ngay v1." #scope-out

> "Mình quan trọng nhất là: không miss deadline. Đo bằng tỉ lệ task
  on-time. Hiện tại 72%, muốn 90% sau 3 tháng." #need #decision

> "Compliance? Không thu PII khách hàng, chỉ task nội bộ. Nhưng tốt
  hơn check với Legal." #followup #glossary("PII")

[BA: Sarah nhấn mạnh on-time rate ≥2 lần — metric chính.]

> "Coordinator có 3 người, mỗi người 4-6 campaign cùng lúc. Peak là
  cuối quý." #constraint

> "Mình budget khoảng 3 tháng, không kéo dài thêm." #constraint

[?: Sarah có nhắc 1 hệ thống cũ "Trello" trước đây bỏ — chưa rõ lý do
bỏ, follow-up sau.]

## Downstream References

(empty — sẽ filled khi structure session log)

## History

- 2026-05-14: captured.
```

## Vì sao note này tốt

- Verbatim quotes giữ nguyên (giọng Sarah dễ nhận).
- `[BA:]` đánh dấu rõ chỗ BA diễn giải.
- `[?]` đánh dấu chỗ chưa rõ + follow-up.
- Tags inline nhưng KHÔNG tag mọi câu (chỉ ý chính).
- Glossary candidate ("PII") flag rõ.
- Decision (90% target) flag → sẽ thành objective trong BRD.
- Constraint (3 coordinator, 3 tháng) flag → sẽ thành CON-.

## Anti-example

❌ Bad note:
```markdown
## Raw Content

Sarah là sponsor và sẽ approve scope. Cô ấy muốn giảm missed deadline
xuống còn 10%. Compliance không phải vấn đề lớn. Engagement 3 tháng.
```

Lỗi:
- Paraphrase toàn bộ → mất verbatim signal (giọng Sarah, sự nhấn mạnh).
- "Compliance không phải vấn đề lớn" — đây là BA inference, không phải
  Sarah nói nguyên văn. Sarah nói "tốt hơn check với Legal" = ngược lại.
- Số 90% gốc bị đổi thành 10% (mất chính xác).
- Không có tag.
- Không có `[?]` cho Trello followup.
