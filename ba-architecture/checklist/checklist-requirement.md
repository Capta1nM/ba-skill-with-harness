# Checklist — Analyzed Requirement (REQ / NFR / CON / ASM)

## Metadata required

- ID prefix: `REQ-` functional | `NFR-` non-functional | `CON-` constraint
  | `ASM-` assumption
- File path: `docs/requirements/analyzed/<ID>.md`
- Status: `draft | review | agreed | changed | retired`
- Priority: must | should | could | wont (MoSCoW)
- Module: MOD-XXX hoặc `unassigned` + reason

## DoR (vào `review`)

- [ ] Unique ID assigned.
- [ ] Source chain complete: REQ → RAW (≥1) → SES (nếu formal) → Note
      (bắt buộc).
- [ ] Atomic: 1 need / item. Không "and"/"or" join independent
      behaviors.
- [ ] Statement testable: có thể viết ≥1 acceptance condition.
- [ ] Module assignment hoặc unassigned + reason.
- [ ] Priority MoSCoW set.
- [ ] Glossary terms used đã có trong glossary.md.
- [ ] Rationale: quote stakeholder where possible.

## DoD (vào `agreed`)

- [ ] Stakeholder owner source statement reviewed + accepted analyzed
      version.
- [ ] Traceability matrix row exists.
- [ ] Acceptance condition Given/When/Then drafted.
- [ ] Dependencies (depends on / blocks) listed.

## Trace links bắt buộc

- Upstream: ≥1 RAW (mandatory).
- Downstream (filled khi propagate): BR-X.X, SR-X.X.X, US-XXX, SCR-XXX.

## Anti-patterns

- ❌ Statement có "shall" + "and" gộp 2 behavior.
- ❌ NFR không đo được ("hệ thống phải nhanh").
- ❌ Inferred requirement không flag là ASM.
- ❌ Đè ID đã retired (ID append-only).
- ❌ Statement giải pháp ("hệ thống dùng Redis cache") thay vì need.
