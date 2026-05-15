# Requirement Item

Save analyzed items under `docs/requirements/analyzed/<ID>.md`.

Use this template for functional requirements (`REQ-`), non-functional
requirements (`NFR-`), constraints (`CON-`), and assumptions (`ASM-`). The
fields are the same; the prefix differs.

## Metadata

- ID:
- Type: functional | non-functional | constraint | assumption
- Module:
- Priority: must | should | could | wont (MoSCoW)
- Status: draft | review | agreed | changed | retired
- Owner:
- Last reviewed:

## Source

| Raw ID | Session | Note (raw material) | Stakeholder | Date |
| --- | --- | --- | --- | --- |
| RAW-XXX | SES-... | MN-... / TR-... / EM-... | STK-... |  |

A requirement without at least one raw source is `draft` at best.
Chuỗi truy vết đầy đủ: REQ → RAW → SES → Note. Mỗi mắt xích bắt buộc.

## Statement

One sentence. Atomic. Testable. Avoid "and"/"or" that joins independent
behaviors.

> The system shall ...

## Rationale

Why does the business need this? Quote the stakeholder where possible.

## Acceptance Conditions

Written in a testable form.

- Given ..., when ..., then ...
- Given ..., when ..., then ...

## Dependencies

- Depends on: REQ-XXX.
- Blocks: REQ-XXX.

## Glossary Terms Used

- Term (link to `docs/domain/glossary.md`).

## Open Questions

- Q1.

## Downstream Trace (filled as it propagates)

- BRD section: BR-X.X.
- SRS clause / PRD outcome: SR-X.X.X / OUT-XXX.
- User stories: US-XXX.
- Wireframes: SCR-XXX.

## History

- YYYY-MM-DD: created.
