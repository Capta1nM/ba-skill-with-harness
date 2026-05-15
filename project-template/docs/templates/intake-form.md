# Intake Form

Capture every new stakeholder request through this form before producing any
BA artifact. Save under
`docs/elicitation/intake/<date>-<source>.md`.

## Metadata

- Intake ID: INT-YYYY-MM-DD-NNN
- Captured by:
- Date:
- Status: draft | review | accepted | rejected

## Source

- Type: email | ticket | meeting | call | document | other
- Origin: who sent it / where it came from
- Attachments / links:
- Raw source notes:
  Liệt kê note ID đã capture dưới `docs/elicitation/notes/` chứa
  nguyên liệu thô đã sinh ra intake này (email gốc, transcript, file
  khách share). Nếu chưa có → tạo trước, rồi mới ghi intake.
  - `EM-YYYY-MM-DD-<slug>` / `MN-...` / `DOC-...`

## Verbatim Statement

Capture the request as the stakeholder stated it. Do not paraphrase yet.

```text

```

## Restated As Work Item

After reading the verbatim:

- One-sentence restatement of the ask:
- Implicit assumptions you noticed:
- Anything you are guessing at:

## Phase Routing

- Likely phase (P1 - P6 or harness improvement):
- Reason:

## Affected Artifacts (if any exist)

- Stakeholder register:
- Requirements:
- BRD sections:
- SRS clauses / PRD outcomes:
- Stories:
- Wireframes:

## Risk Checklist

Mark `x` for each flag that applies (see `docs/INTAKE.md`):

- [ ] Scope
- [ ] Sign-off
- [ ] Compliance
- [ ] Cross-stakeholder
- [ ] Non-functional
- [ ] External system
- [ ] Migration
- [ ] Domain language
- [ ] Methodology
- [ ] Cascading

Lane: tiny | normal | high-risk

## Open Questions

Questions you cannot answer without going back to the stakeholder.

- Q1.

## Clarifying Q&A

Câu hỏi agent đặt ra trong intake và câu trả lời từ stakeholder/BA lead.
Đây là phần BẮT BUỘC điền trước khi đóng intake — câu trả lời không được
chỉ tồn tại trong chat, phải nằm ở đây để các phase sau đọc được.

| # | Câu hỏi | Người trả lời | Câu trả lời | Đưa thành assumption/decision nào? |
| --- | --- | --- | --- | --- |
| Q1 |  |  |  |  |

Nếu câu trả lời là "chưa biết, sẽ làm rõ trong P1/P2" → vẫn ghi vào đây
với note "deferred to <session/phase>", KHÔNG để trống.

## Next Step

What is the next concrete action, and who owns it?
