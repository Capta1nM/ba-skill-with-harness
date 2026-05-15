# Traceability Matrix

This file maps stakeholder needs to BA artifacts and back.

No engagement is loaded yet. Do not add rows until a real stakeholder request
has entered intake and at least one requirement has been analyzed.

## Purpose

The matrix is the BA's control panel. It answers:

- Which requirements are not yet in the BRD?
- Which BRD sections have no SRS coverage?
- Which user stories lack a wireframe?
- If we retire requirement REQ-042, which artifacts must be revisited?
- Which agreed artifacts depend on a still-draft upstream parent?

## Status Values

| Status | Meaning |
| --- | --- |
| `planned` | Accepted as in-scope, not yet drafted |
| `draft` | Authored, not yet circulated |
| `review` | Circulated, awaiting feedback |
| `agreed` | Accepted by stakeholder(s) |
| `signed-off` | Document-level acceptance recorded (BRD/SRS only) |
| `changed` | Was agreed, modified via change request |
| `retired` | No longer in scope |

A row should not mark a downstream column `agreed` while the upstream column
is still `draft`. The matrix should make that contradiction visible.

## Matrix (Default Empty)

| Req ID | Stakeholder | Source Note | Session | Raw Stmt | Module | BRD | SRS / PRD | Story | Wireframe | Status | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TBD | Populate when a requirement enters the catalog | | | | | | | | | planned | none |

Mỗi REQ phải có cả Source Note (MN/TR/EM/DOC/MSG/OBS/SUR) — đây là đáy
truy vết. Session là tùy chọn (RAW có thể trích thẳng từ note ngoài
session formal, vd: email).

## Coverage Dimensions

A complete matrix supports these queries:

1. **Forward trace (source -> outcome):** REQ-042 -> BR-5.2 -> SR-4.3.1 ->
   US-014 -> SCR-Login. Used to prove a stakeholder need reached delivery.
2. **Backward trace (outcome -> source):** SCR-Login -> US-014 -> SR-4.3.1 ->
   BR-5.2 -> REQ-042 -> SES-2026-05-12-CFO -> STK-007. Used to defend a
   design decision when challenged.
3. **Impact trace (artifact -> dependents):** "If we change BR-5.2, what
   moves?" — every cell in BR-5.2's row downstream of it.

## Maintenance Rules

- Update the matrix in the same change that updates the underlying artifact.
  An out-of-date matrix is worse than no matrix.
- Add a row when a new requirement, NFR, constraint, or assumption is
  promoted from raw to analyzed.
- Mark a row `retired` rather than deleting it. Retired rows preserve why a
  past stakeholder need was dropped.
- When two rows are merged (duplicate requirement), keep the lower ID and
  retire the higher one with a `merged into REQ-XXX` note.

## Cross-Check Reports

When a cross-artifact discrepancy is found (e.g. wireframe field with no SRS
backing), record it in `docs/project/validation/<date>-crosscheck.md` and
reference the offending rows in this matrix. Resolve before any downstream
artifact moves to `agreed`.
