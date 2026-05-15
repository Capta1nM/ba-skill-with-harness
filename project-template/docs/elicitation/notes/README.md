# Notes (Raw Source Material)

Dump nguyên liệu thô trước khi xử lý. Nơi này tiếp nhận MỌI raw input
trước khi nó được structure thành session log, RAW statement, hay REQ.

Khi audit hỏi "câu này trong BRD đến từ đâu?" — chuỗi truy vết kết thúc
ở đây:

```
REQ-042 -> RAW-118 -> SES-2026-05-12-CFO -> MN-2026-05-12-cfo-1on1.md
```

Note **không bao giờ bị edit hồi tố và không bị xóa**. Nếu nội dung sai,
add note mới với status `superseded` thay vì sửa.

## Prefix theo loại

| Prefix | Loại | Ví dụ filename |
| --- | --- | --- |
| `MN-` | Meeting note — họp, workshop, sync, daily | `MN-2026-05-12-marketing-sync.md` |
| `TR-` | Transcript — audio/video chuyển text | `TR-2026-05-15-coordinator-interview.md` |
| `EM-` | Email — thư từ stakeholder | `EM-2026-05-13-cfo-budget-question.md` |
| `DOC-` | Document — file khách share (excerpt + link) | `DOC-2026-05-14-current-process-flow.md` |
| `MSG-` | Chat message — Slack/Teams/Zalo thread | `MSG-2026-05-16-it-ops-deployment.md` |
| `OBS-` | Observation — shadowing, quan sát thực địa | `OBS-2026-05-17-warehouse-shift.md` |
| `SUR-` | Survey response — khảo sát | `SUR-2026-05-20-coordinator-pulse.md` |

Date trong filename = ngày sự kiện diễn ra (họp, gửi email, share file),
KHÔNG phải ngày bạn capture.

## Quy ước nội dung

- Giữ verbatim tối đa có thể. Paraphrase chỉ khi cần, đánh dấu rõ.
- Một note có thể chứa input từ nhiều stakeholder (vd: workshop) — liệt
  kê đủ trong header.
- Nếu là transcript dài, có thể split theo topic nhưng giữ source gốc
  rõ ràng (vd: `TR-...-part1.md`, `TR-...-part2.md`).
- Attachment (slide, ảnh whiteboard) — link tới file ở `attachments/`
  hoặc đường dẫn ngoài.

## Linkage downstream

Mỗi note có thể được tham chiếu bởi:

- 0..n session log dưới `sessions/` (1 session có thể consume nhiều
  note; 1 note có thể serve nhiều session).
- 0..n RAW statement dưới `requirements/raw/` (nếu RAW trích thẳng từ
  note mà không qua session formal — vd: từ email).

Session log + RAW statement bắt buộc reference note ID source.

## Khi nào dump 1 note

NGAY khi nhận được. Đừng đợi "đủ thời gian process". Workflow:

1. Họp xong → tạo MN ngay với raw notes (5 phút).
2. Có thời gian → tạo session log structured (`sessions/SES-*.md`),
   reference back tới MN.
3. Process kỹ → extract RAW statements, reference tới SES.

Bước 1 là không thể skip. Bước 2-3 có thể defer nhưng phải có owner +
deadline.
