# Utility — DUMP raw note

3 cách tùy độ dài raw:

- A. File raw lớn / binary: save vào notes/attachments/, prompt point path.
- B. Text raw vừa (< ~50 dòng): paste vào prompt.
- C. File text ngoài repo: cho agent absolute path, agent đọc.

---

## Cách A — File đã save vào notes/attachments/

```text
Process raw file: docs/elicitation/notes/attachments/<filename>

Bổ sung context (nếu file không tự nói):
- Stakeholders: <STK-XXX, tên, role>
- Event date: <YYYY-MM-DD>
- Related plan session: <SES-... nếu có>

Dispatch ba-session-capturer task=dump-note với source_type=file-attachment.

Tạo docs/elicitation/notes/<PREFIX>-<event-date>-<slug>.md theo template:
- Source file(s): link tới attachment.
- Verbatim raw (nếu text) hoặc tóm tắt + reference (binary).
- Quick tag inline.
- Status: captured.

KHÔNG xóa/move attachment. KHÔNG extract RAW statement. KHÔNG tạo session.
```

---

## Cách B — Paste trực tiếp (raw ngắn)

```text
Manual dump.

Loại: <meeting | observation | chat | email body>
Event date: <YYYY-MM-DD>
Stakeholders: <STK-XXX>
Context 1-3 dòng:

Nội dung:
<<<
[verbatim, [BA:] cho ghi chú, [?] cho chỗ không rõ]
>>>

Dispatch ba-session-capturer task=dump-note với source_type=paste.
Tạo notes/<PREFIX>-<event-date>-<slug>.md. Source: "manual dump, no
source file" + lý do.

⚠️ Nếu > ~50 dòng → DỪNG, save vào notes/attachments/ rồi dùng Cách A.
```

---

## Cách C — File ngoài repo

```text
Process external file: <absolute path>

Dispatch ba-session-capturer task=dump-note với source_type=external-path.

1. Đọc file.
2. Quyết định: archive vào notes/attachments/ hay reference-only?
3. Đợi tôi confirm → tạo note như Cách A.

KHÔNG tự copy file vào repo mà không hỏi.
```
