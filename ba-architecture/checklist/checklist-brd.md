# Checklist — BRD (Business Requirements Document)

## Metadata required

- File path: `docs/brd/brd.md`
- Status: `draft | review | agreed | signed-off | changed`
- Owner: BA
- Sponsor: accountable for sign-off

## DoR (vào `review`)

- [ ] Mọi section drafted, không TBD trong section published.
- [ ] Section 1 Executive Summary: 1 trang stand-alone.
- [ ] Section 3 Objectives + Metrics: mỗi metric ĐO ĐƯỢC (baseline,
      target, measurement method).
- [ ] Section 5 Scope: link tới scope.md, mỗi item trace REQ ID.
- [ ] Section 6 High-Level BR: mỗi BR-X.X trace ≥1 REQ.
- [ ] Section 7 NFR business: tất cả attribute (performance,
      availability, security, accessibility, compliance, privacy,
      localization) có row.
- [ ] Section 9 Risks: ≥3 risk với mitigation.
- [ ] Glossary terms used in BRD đã có trong glossary.md.
- [ ] KHÔNG có design/UI decision trong BRD body.

## DoD (vào `agreed`)

- [ ] Stakeholder review + comments incorporated.
- [ ] Open issues list (section 12) có owner + target date.

## DoD (vào `signed-off`)

- [ ] Sponsor sign-off captured ở `docs/validation/<date>-signoff-brd.md`
      với date + scope statement.
- [ ] Mọi must-have REQ map BRD section trong traceability matrix.
- [ ] Glossary terms used; không acronym chưa định nghĩa.

## Trace links bắt buộc

- Upstream: requirements/analyzed/, scope.md, glossary.md.
- Downstream: SRS/PRD, stories, validation/signoff.

## Anti-patterns

- ❌ Metric không đo được ("improve customer satisfaction").
- ❌ Design decision trong BRD ("dùng React frontend").
- ❌ BR-X.X không trace REQ source.
- ❌ Missing NFR section (skip compliance/privacy).
- ❌ Sign-off "informal" không có file evidence.
