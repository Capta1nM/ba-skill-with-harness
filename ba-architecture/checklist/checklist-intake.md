# Checklist — Intake Form

## Metadata required

- ID prefix: `INT-`
- File path: `docs/elicitation/intake/<YYYY-MM-DD>-<slug>.md`
- Owner: BA lead
- Status: `draft | review | accepted | rejected`

## DoR (vào `review`)

- [ ] Verbatim statement của khách điền nguyên văn (KHÔNG paraphrase).
- [ ] Source link tới raw note (nếu có file gốc) hoặc "manual capture".
- [ ] Restated as work item — diễn giải 1 câu của BA.
- [ ] Phase routing đề xuất (P1-P6 hoặc harness-improvement).
- [ ] Risk checklist tick đầy đủ (10 flag trong RISK_LANES).
- [ ] Lane đề xuất: tiny / normal / high-risk + reason.
- [ ] Stakeholder dự kiến phỏng vấn list ra (chưa cần ID, role là đủ).
- [ ] Clarifying Q&A: cột "Câu hỏi" filled, cột "Câu trả lời" trống.

## DoD (vào `accepted`)

- [ ] Clarifying Q&A: mọi câu có câu trả lời (hoặc `deferred to <session>`).
- [ ] Cột "Đưa thành assumption/decision nào?" filled cho từng Q.
- [ ] Risk flags + lane confirmed bởi BA lead.
- [ ] Bất kỳ ASM dự kiến → list ra, tạo thật ở P2.
- [ ] Bất kỳ ADR dự kiến → list ra, tạo trước khi sang P1.

## Trace links bắt buộc

- Upstream: raw note (nếu có) hoặc external source description.
- Downstream (filled khi propagate): stakeholders.md entries dự kiến,
  session IDs dự kiến trong plan.md.

## Anti-patterns

- ❌ Skip Clarifying Q&A và nhảy thẳng sang P1.
- ❌ Lane tự gán "tiny" để bypass review khi rõ ràng có risk flag.
- ❌ Bịa thêm stakeholder không có trong đề bài + không infer được.
- ❌ Restate quá xa so với verbatim (loss of fidelity).
