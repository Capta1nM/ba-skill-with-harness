# Requirements

Suggested layout:

```text
requirements/
  raw/
    RAW-<id>.md                  # verbatim or near-verbatim captures
  analyzed/
    REQ-<id>.md                  # functional requirements
    NFR-<id>.md                  # non-functional requirements
    CON-<id>.md                  # constraints
    ASM-<id>.md                  # assumptions
  catalog.md                     # index over all analyzed items
```

Use `docs/templates/requirement-item.md` for analyzed items.

Raw statements must point to a session ID. Analyzed items must point to one
or more raw statements.
