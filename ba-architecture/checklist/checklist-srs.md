# Checklist — SRS (Software Requirements Specification)

Áp dụng khi methodology=`srs-only`. Nếu PRD+Stories dùng checklist-prd.

## Metadata required

- File path: `docs/srs/srs.md`
- Status: `draft | review | agreed | signed-off | changed`

## DoR (vào `review`)

- [ ] Section 1 Introduction: purpose, scope, definitions, references.
- [ ] Section 2 Overall Description: product perspective, user classes,
      operating environment, design constraints, assumptions.
- [ ] Section 3 External Interfaces: UI (cross-ref wireframes), hardware,
      software (integration matrix), communication.
- [ ] Section 4 Functional Requirements: group by module, mỗi SR-X.Y.Z
      có trace BR + REQ, inputs, processing, outputs, error handling,
      acceptance Given/When/Then.
- [ ] Section 5 NFR: performance, availability, security, accessibility,
      compliance/privacy, maintainability, i18n/l10n, retention, audit.
- [ ] Section 6 Data Requirements: entities, migration, reporting.
- [ ] Section 7 Use Cases: link tới use case files.
- [ ] Section 8 Open Issues: ID + owner + target.

## DoD (vào `signed-off`)

- [ ] Tech lead confirm buildability.
- [ ] Product owner confirm intent preserved.
- [ ] Sign-off evidence `docs/validation/<date>-signoff-srs.md`.
- [ ] Mọi BR có ≥1 SR clause cover.

## Trace links bắt buộc

- Upstream: BRD, requirements/analyzed/, glossary.md.
- Downstream: stories (nếu có), wireframes/.

## Anti-patterns

- ❌ SR clause restate REQ word-by-word (no added precision).
- ❌ Missing error handling per SR.
- ❌ Acceptance không testable.
- ❌ NFR threshold dạng "fast enough".
