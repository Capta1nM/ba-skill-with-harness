# 🔁 Handoff / Resume

Dùng khi mở session chat mới sau khi nghỉ qua ngày/tuần, hoặc khi
handover cho BA khác / agent khác. Orchestrator báo cáo state đầy đủ
trước khi nhận task mới.

---

```
@ba-architecture

Type: Handoff / Resume
Last work (nếu nhớ, optional): 📝 (vd "tuần trước vừa xong BRD draft, 
                                   chuẩn bị crosscheck")
Time gap: 📝 (vd "2 tuần" / "qua đêm" / "mới handover từ BA1 sang BA2")
```

---

**Orchestrator sẽ:**

1. Đọc full source-of-truth theo order trong `AGENTS.md`.
2. Báo cáo:
   - Engagement context (1 đoạn từ intake).
   - Phase hiện tại + lý do (suy từ artifact + phaseStatus).
   - Artifact đã agreed/signed-off + ngày + ai signed-off.
   - Methodology decision đã log? Shape nào?
   - Open issue / change request đang treo + owner.
   - Stakeholder chưa phỏng vấn (plan vs sessions/).
   - Decisions log gần nhất (5 cái mới nhất).
   - Memory entries active (5 cái relevant nhất).
3. **KHÔNG ghi file, KHÔNG dispatch worker agent.** Read-only briefing.
4. Đợi user confirm hiểu đúng state.
5. Output cuối: đề xuất ≥1 next action với justification.

**Lưu ý:** đây là briefing duy nhất bạn cần. Sau briefing, dùng prompt
khác (00-06) cho từng task type cụ thể.
