# Note (Raw Source Material)

Template dùng cho mọi loại raw input: meeting (MN), transcript (TR),
email (EM), document (DOC), chat (MSG), observation (OBS), survey (SUR).

Save dưới `docs/elicitation/notes/<PREFIX>-<YYYY-MM-DD>-<slug>.md`.

## Metadata

- ID: `<PREFIX>-YYYY-MM-DD-<slug>`
- Type: meeting | transcript | email | document | chat | observation | survey
- Event date:
- Captured date:
- Captured by:
- Status: captured | processed | superseded
- Stakeholders involved: STK-XXX, STK-YYY (link tới stakeholders.md)
- Related plan session (nếu có): SES-... (planned ID — session log thực
  sẽ ghi sau)
- Source file(s): liệt kê path tới file raw gốc nếu có (transcript,
  email export, PDF khách share, ảnh whiteboard, audio recording...).
  - File nhỏ và là text → có thể paste verbatim vào "Raw Content" dưới
    và không cần file riêng.
  - File lớn / binary → save dưới `notes/attachments/<filename>` và
    reference path ở đây.
  - File ngoài repo (Drive/SharePoint) → ghi link + checksum + access
    note.
  - Nếu dump tay không có file gốc → ghi "manual dump, no source file"
    và nêu lý do (vd: viết tay trong sổ).

## Context

1-3 dòng: bối cảnh cuộc họp/email/document. Đủ cho người 6 tháng sau đọc
hiểu lý do tồn tại của note này.

- Trigger: ai initiate, vì sao.
- Setting: kênh (Zoom/Teams/in-person/email thread), thời lượng nếu có.
- Tài liệu kèm: link/path attachments nếu có.

## Raw Content

Phần chính. GIỮ VERBATIM tối đa có thể.

Quy ước:
- `>` quote nguyên văn lời stakeholder.
- `[BA:]` ghi chú/diễn giải của BA, phải đánh dấu rõ.
- `[?]` chỗ nghe không rõ / cần verify.
- `[ATT:<filename>]` reference tới attachment.

```text

```

## Attachments

- `attachments/<filename>` — file gốc (slide, ảnh whiteboard, screenshot).
- Hoặc link ngoài (Drive, Confluence, SharePoint) với tên file mô tả.

KHÔNG paste base64 hoặc nội dung file binary vào note này.

## Quick Tags (optional, hỗ trợ extract sau)

Đánh dấu inline trong Raw Content bằng tag để dễ tìm:

- `#need` — câu nói lên need/pain
- `#nfr` — non-functional hint (performance, security...)
- `#constraint` — ràng buộc
- `#assumption` — giả định BA hoặc stakeholder
- `#scope-in` / `#scope-out` — gợi ý scope
- `#glossary` — term chưa định nghĩa
- `#decision` — quyết định chốt trong họp
- `#followup` — câu hỏi cần verify sau

## Downstream References (filled khi process)

Cập nhật khi note được consume bởi artifact downstream:

| Consumed by | ID | Date |
| --- | --- | --- |
| Session log | SES-... |  |
| RAW statement | RAW-... |  |
| Glossary entry | term name |  |
| Decision (ADR) | DEC-... |  |

Note có downstream reference → status `processed`.
Note không còn đúng (vd: stakeholder đính chính sau) → tạo note mới, link
note cũ thành `superseded by <new-id>`.

## History

- YYYY-MM-DD: captured.
- YYYY-MM-DD: processed (extracted to SES-XXX, RAW-XXX..YYY).
