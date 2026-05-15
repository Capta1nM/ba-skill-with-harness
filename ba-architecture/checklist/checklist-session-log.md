# Checklist — Session Log

## Metadata required

- ID prefix: `SES-YYYY-MM-DD-<slug>`
- File path: `docs/elicitation/sessions/SES-<date>-<slug>.md`
- Status: `draft | review | agreed`
- Technique: interview | workshop | observation | document review | survey

## DoR (vào `review`)

- [ ] SES ID, date, duration, technique, lead BA, note-taker filled.
- [ ] Stakeholders present + absent (with reason).
- [ ] Source Notes section: ≥1 raw note referenced (MN/TR/...). Note
      tồn tại trên đĩa trước khi viết session log.
- [ ] Objective: cái gì cần học được từ session.
- [ ] "What actually happened" narrative ngắn.
- [ ] Raw Notes section: verbatim, format dễ đọc.
- [ ] Extracted Raw Statements table: mỗi row có Raw ID, verbatim,
      source stakeholder, source note, initial classification.
- [ ] Follow-up questions list.
- [ ] Glossary candidates flag.
- [ ] Decisions made (nếu có) → đề xuất ADR.

## DoD (vào `agreed`)

- [ ] Attendees confirmed log captured discussion (async OK).
- [ ] Raw statements parked trong `docs/requirements/raw/`.
- [ ] Follow-ups tracked (open questions hoặc next session planned).
- [ ] Note status đã `processed`, downstream refs updated.

## Trace links bắt buộc

- Upstream: ≥1 raw note (`docs/elicitation/notes/`).
- Upstream: stakeholders.md (attendees), plan.md (planned SES).
- Downstream: requirements/raw/RAW-*.md.

## Anti-patterns

- ❌ Session log không reference note nào (nguồn ở đâu?).
- ❌ Raw statements không verbatim.
- ❌ Forget follow-up tracking → câu hỏi chết trong transcript.
- ❌ Note status vẫn `captured` sau khi session log đã agreed.
