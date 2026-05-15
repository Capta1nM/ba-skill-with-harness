# Checklist — Elicitation Plan

## Metadata required

- File path: `docs/elicitation/plan.md`
- Status: `draft | review | agreed`

## DoR (vào `review`)

- [ ] Objectives section: ≥2 outcome cụ thể cho P1+P2.
- [ ] Techniques table: tick + reason cho mỗi technique
      (interview/workshop/observation/doc review/survey/prototyping).
- [ ] Session schedule: SES-ID dự kiến, stakeholders, technique,
      objective, prerequisite, expected output, scheduled date.
- [ ] Mỗi primary stakeholder có ≥1 session, hoặc lý do skip.
- [ ] Dependencies giữa session list ra (vd: SES-A trước SES-B).
- [ ] Timeline week-by-week.
- [ ] Risks ≥3, mỗi cái có mitigation.
- [ ] Exit criteria sang P3 đầy đủ.

## DoD (vào `agreed`)

- [ ] Sessions scheduled thật (hoặc formally deferred với reason).
- [ ] Materials (guide, agenda) shared với participants ahead.
- [ ] Project lead/sponsor confirm plan.

## Trace links bắt buộc

- Upstream: intake + stakeholders.md.
- Downstream: guides/*.md (mỗi session technique=interview cần 1 guide),
  sessions/SES-*.md (filled sau khi run).

## Anti-patterns

- ❌ Session đầu là user thường (phải là sponsor/decision maker để
  confirm objective + scope).
- ❌ Plan dồn quá tải (>3 session/tuần / 1 BA).
- ❌ Không có session "reconciliation" khi nhiều stakeholder mâu thuẫn
  dự kiến.
- ❌ Skip workshop khi có ≥2 stakeholder cần align cùng lúc.
