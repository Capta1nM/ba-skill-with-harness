# Checklist — Raw Statement

## Metadata required

- ID prefix: `RAW-` (tuần tự, không reset)
- File path: `docs/requirements/raw/RAW-<id>.md`
- Status: `captured | promoted | parked | retired`

## DoR (vào `captured`)

- [ ] Unique ID assigned.
- [ ] Source: ≥1 note ID (MN/TR/EM/...) + stakeholder ID.
- [ ] Verbatim hoặc near-verbatim statement.
- [ ] Initial classification: functional | NFR | constraint | assumption
      | out-of-scope | glossary candidate | decision input.
- [ ] Session ID (nếu capture qua session formal).

## DoD (vào `promoted`)

- [ ] Đã được consume bởi ≥1 REQ/NFR/CON/ASM hoặc glossary entry hoặc
      ADR.
- [ ] Downstream REQ-* ID listed trong RAW file.

## Status `parked`

Khi RAW chưa rõ đủ để promote nhưng đáng giữ:

- [ ] Reason park: cần thêm context / chờ stakeholder confirm / out of
      current phase scope.
- [ ] Review date: khi nào re-check.

## Trace links bắt buộc

- Upstream: note ID + stakeholder ID (BẮT BUỘC).
- Downstream: REQ/NFR/CON/ASM/glossary/ADR (filled khi promote).

## Anti-patterns

- ❌ RAW không có source note (orphan).
- ❌ RAW là BA paraphrase chứ không phải lời stakeholder.
- ❌ Promote RAW thẳng thành REQ mà không có user confirm.
- ❌ Multiple ý trong 1 RAW (atomic rule).
