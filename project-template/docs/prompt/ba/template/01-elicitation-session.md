# 🎙️ Elicitation Session

Dùng sau khi có buổi phỏng vấn / workshop / observation / nhận email
khách / nhận file khách share. Orchestrator tạo note + structure
session log + extract RAW + propose REQ promotion.

Nếu raw lớn / binary → save vào `docs/elicitation/notes/attachments/`
trước, point path ở phần "Source". Nếu raw nhỏ (<50 dòng) → paste
trực tiếp ở "Raw content".

---

```
@ba-architecture

Type: Elicitation
Session technique: 📝 (interview | workshop | observation | document-review | email | survey | chat)

Stakeholders involved: 📝 (vd "STK-002a Marketing Coordinator A")
Event date: 📝 (YYYY-MM-DD — ngày sự kiện diễn ra)
Duration: 📝 (vd "45 min" — để trống nếu N/A)
Context 1-3 dòng: 📝 (trigger, setting, mục tiêu của session)

Source (chọn 1):
- [📝] File attachment: 📝 (path tương đối — vd "docs/elicitation/notes/attachments/2026-05-14-coord-a-transcript.txt")
- [📝] Paste trực tiếp (raw < 50 dòng):
  ```
  📝
  (verbatim, [BA:] cho ghi chú, [?] cho chỗ không rõ)
  ```
- [📝] Manual dump (note tay từ sổ, không file): 📝 (lý do)

Related plan session (nếu có): 📝 (SES-... đã plan trong plan.md)

Focus hint (optional — gợi ý cho extraction):
- 📝 (vd "đặc biệt chú ý phần process flow phase 'review'")

Re-promotion: 📝 (yes/no — sau khi capture, có muốn agent đề xuất
promote RAW → REQ ngay không? Default yes nếu engagement đang trong
P2.)
```

---

**Orchestrator sẽ:**

1. Dispatch `ba-session-capturer`:
   - Detect prefix note (MN/TR/EM/DOC/MSG/OBS/SUR) từ technique +
     source.
   - Tạo `docs/elicitation/notes/<PREFIX>-<event-date>-<slug>.md`
     verbatim + quick tags inline.
   - Status: captured.
2. Dispatch tiếp `ba-session-capturer` task=structure-session:
   - Tạo `docs/elicitation/sessions/SES-<event-date>-<slug>.md`.
   - Extract RAW statements vào `docs/requirements/raw/`.
   - Update note status: processed.
3. (Nếu re-promotion=yes) Dispatch `ba-requirement-analyst`
   task=propose-promotions:
   - Trình bảng REQ/NFR/CON/ASM dự kiến.
   - Đợi user confirm trước khi ghi.
4. Update `TRACEABILITY_MATRIX.md` (Source Note + Session + Raw rows).
5. Báo cáo: số RAW tạo, glossary candidates, red flags, next step.
