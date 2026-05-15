# Product Requirements Document

Save as `docs/prd/prd.md` (rename `srs/` folder to `prd/` for this
methodology shape).

The PRD shape is product-led: it specifies outcomes, user value, and
product capabilities, then leans on user stories for delivery detail. Use
this shape when the engagement has a product manager, ongoing iteration,
and a delivery team comfortable working from outcomes plus stories.

If you need IEEE-style detailed system specification, use
`docs/templates/srs.md` instead. The methodology choice must be recorded in
`docs/decisions/`.

## Metadata

- Product name:
- Version:
- Owner (Product / BA):
- Status: draft | review | agreed | signed-off | changed
- Sign-off date / scope:

## 1. Product Summary

What is the product, who is it for, and what outcome does it produce?

## 2. Vision & Strategic Fit

Why this product, why now? How does it sit in the wider portfolio?

## 3. Target Users & Personas

| Persona | Description | Primary need | Frequency of use | Trace to STK-* |
| --- | --- | --- | --- | --- |

## 4. Product Outcomes

Outcomes are measurable changes in user or business behavior.

| OUT ID | Outcome | Metric | Baseline | Target | Source REQs / OBJs |
| --- | --- | --- | --- | --- | --- |
| OUT-01 |  |  |  |  |  |

## 5. Capabilities

A capability is a coarse-grained product feature. Each capability decomposes
into epics and user stories.

| CAP ID | Capability | Outcome served | Module | Source REQs | Epics |
| --- | --- | --- | --- | --- | --- |
| CAP-01 |  | OUT-01 | MOD-XXX | REQ-XXX | EPC-01 |

## 6. User Journeys

For each headline persona, walk the primary journey end to end. Reference
capability IDs at each step.

```text

```

## 7. Non-Functional Requirements

| NFR ID | Attribute | Requirement | Threshold | Source |
| --- | --- | --- | --- | --- |
| NFR-01 | Performance | | | |
| NFR-02 | Availability | | | |
| NFR-03 | Security | | | |
| NFR-04 | Accessibility | | | |
| NFR-05 | Compliance | | | |
| NFR-06 | Privacy / retention | | | |
| NFR-07 | Localization | | | |

## 8. Release Plan (high-level)

| Release | Capabilities | Notes |
| --- | --- | --- |
| MVP | | |
| R2 | | |

## 9. Out Of Scope

| Item | Reason | Re-evaluate when |
| --- | --- | --- |

## 10. Risks & Open Questions

| ID | Issue | Owner | Status |
| --- | --- | --- | --- |

## 11. Glossary

Reference `docs/domain/glossary.md`.

## Sign-Off

Recorded in `docs/validation/<date>-signoff-prd.md`.

## History

- YYYY-MM-DD: created.
