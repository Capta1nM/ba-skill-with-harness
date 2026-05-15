# Checklist — Stakeholder Register

## Metadata required

- ID prefix: `STK-` (primary từ 001; secondary từ 101)
- File path: `docs/elicitation/stakeholders.md`
- Status: `draft | review | agreed`

## DoR (vào `review`)

- [ ] Mọi stakeholder named trong intake có entry.
- [ ] Mỗi entry có: ID, name/role, organization, interest, influence
      (H/M/L), decision power, communication preference, availability.
- [ ] Primary stakeholders ≥1 ở mỗi nhóm: sponsor, primary user,
      tech/ops.
- [ ] Secondary stakeholders xét đủ: compliance, legal, security, ops,
      support. Skip nhóm nào → ghi lý do "excluded with reason".
- [ ] Influence/interest matrix vẽ (ASCII OK).

## DoD (vào `agreed`)

- [ ] Sponsor (hoặc accountable role) reviewed + accepted.
- [ ] Không entry "TBD" trong primary rows.
- [ ] Mọi excluded group có lý do explicit.

## Trace links bắt buộc

- Upstream: intake form (đề bài đề cập đến role nào).
- Downstream: plan.md (mỗi STK ≥1 session hoặc lý do skip).

## Anti-patterns

- ❌ Liệt kê người thay vì role (khi role đại diện nhóm).
- ❌ Bỏ qua compliance/legal mà không ghi reason.
- ❌ Influence/interest đoán không có dẫn chứng.
- ❌ Đánh dấu mọi stakeholder là "high influence" (mất tính phân loại).
