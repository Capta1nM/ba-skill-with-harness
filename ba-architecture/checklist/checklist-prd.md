# Checklist — PRD (Product Requirements Document)

Áp dụng khi methodology=`prd-stories`. Nếu `srs-only` dùng
checklist-srs. Nếu `stories-only` skip PRD/SRS, chỉ checklist-story.

## Metadata required

- File path: `docs/prd/prd.md` (rename folder `docs/srs/` → `docs/prd/`
  sau methodology decision).
- Status: `draft | review | agreed | signed-off | changed`

## DoR (vào `review`)

- [ ] Section 1 Product Summary.
- [ ] Section 2 Vision & Strategic Fit.
- [ ] Section 3 Personas: mỗi persona trace ≥1 stakeholder STK-XXX.
- [ ] Section 4 Outcomes: mỗi OUT-XX có metric, baseline, target, source
      REQ/OBJ.
- [ ] Section 5 Capabilities: mỗi CAP-XX trace BR + module + epic dự kiến.
- [ ] Section 6 User Journeys: mỗi headline persona có ≥1 end-to-end
      journey.
- [ ] Section 7 NFR: đầy đủ 7 attribute (performance/availability/
      security/accessibility/compliance/privacy/localization).
- [ ] Section 8 Release Plan: MVP + R2.
- [ ] Section 9 Out-of-scope: lý do + re-evaluate when.

## DoD (vào `signed-off`)

- [ ] PM + tech lead + sponsor confirm.
- [ ] Sign-off evidence `docs/validation/<date>-signoff-prd.md`.
- [ ] Every capability decomposed thành ≥1 epic.

## Trace links bắt buộc

- Upstream: BRD (objectives), requirements/analyzed/.
- Downstream: epics/, stories/, wireframes/.

## Anti-patterns

- ❌ PRD có implementation detail (DB schema, framework, API endpoint).
- ❌ Outcome = output ("ship feature X") thay vì measurable behavior
  change.
- ❌ Persona không trace stakeholder thực.
- ❌ Capability quá to (cover >5 epic).
