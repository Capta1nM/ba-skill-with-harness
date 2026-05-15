# 🟢 New Engagement

Dùng khi bắt đầu engagement mới với đề bài khách hàng. Orchestrator
chạy intake gate + Phase 1 prep auto.

---

```
@ba-architecture

Type: New Engagement
Task: 📝 (1 câu mô tả mục tiêu — vd "Build internal task tool cho marketing team")

Đề bài verbatim:
<<<
📝 (DÁN NGUYÊN VĂN yêu cầu khách hàng vào đây — email, transcript,
ticket, brief, document. Đừng paraphrase.)
>>>

Nguồn:
- Channel: 📝 (email / meeting / ticket / call / RFP)
- Người gửi / role: 📝 (vd "Sarah Chen, Marketing Lead")
- Tổ chức: 📝 (vd "ACME Corp" — để trống nếu nội bộ)
- Ngày nhận: 📝 (YYYY-MM-DD)

Context bổ sung (nếu có, ngoài đề bài):
- 📝 (vd "đã từng dùng spreadsheet, fail vì miss deadline")
- 📝 (vd "team 5 người, 4-6 campaign cùng lúc")

Constraint biết trước (nếu có):
- Timeline: 📝 (vd "3 tháng launch")
- Budget: 📝 (để trống nếu chưa biết)
- Compliance: 📝 (vd "GDPR / HIPAA / SOX / không")
- Tech stack constraint: 📝 (vd "phải tích hợp với hệ thống X")

Stakeholder ước lượng cần phỏng vấn (nếu biết):
- 📝 (vd "Marketing Lead (sponsor), 3 Coordinator, IT Ops")

Methodology preference (nếu đã có ý):
- 📝 (undecided / srs-only / prd-stories / stories-only — default undecided)
```

---

**Orchestrator sẽ:**

1. Auto-discover engagement từ `.project-config.yml` + cwd.
2. Dispatch `ba-intake-classifier`:
   - Tạo intake form `docs/elicitation/intake/<date>-<slug>.md` với
     verbatim + risk flags + lane.
   - Section "Clarifying Q&A": list câu hỏi cần user trả lời.
3. Trả về:
   - Đường dẫn intake file.
   - Input type / Phase / Lane / Reason.
   - Số clarifying questions chờ trả lời.
   - Hành động kế tiếp.
4. KHÔNG dispatch Phase 1 prep cho đến khi Clarifying Q&A finalized
   (dùng prompt `06-clarification.md` để trả lời).
