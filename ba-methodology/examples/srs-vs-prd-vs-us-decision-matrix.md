# Example — Methodology Decision Matrix

## Example 1: Bank core system replacement (Vendor handover)

| Q | Answer | Bias |
| --- | --- | --- |
| Delivery mode | Fixed-bid 18-month waterfall | srs-only |
| Audit/compliance | SOX + PCI-DSS | srs-only (strong) |
| PM dedicated | Yes (vendor PM) | prd-stories |
| Team size | 40+ devs, ~120 stories | srs-only or prd-stories |
| Vendor or in-house | Vendor handover | srs-only (strong) |

→ Recommended: **srs-only**. ADR rationale: compliance + vendor handover
override product-led bias.

---

## Example 2: SaaS startup new feature (Product-led)

| Q | Answer | Bias |
| --- | --- | --- |
| Delivery mode | Continuous, 2-week sprints | prd-stories or stories-only |
| Audit | None | flexible |
| PM dedicated | Yes (full-time PM) | prd-stories |
| Team size | 6 devs, ~25 stories per quarter | stories-only OK |
| Vendor or in-house | In-house | flexible |

→ Recommended: **prd-stories**. Rationale: PM dedicated, product-led
context. Stories-only also valid if team prefers minimum docs.

---

## Example 3: Internal marketing task tool (the demo)

| Q | Answer | Bias |
| --- | --- | --- |
| Delivery mode | 3-month sprint, internal | stories-only |
| Audit | None | flexible |
| PM dedicated | No (BA part-time) | not prd-stories |
| Team size | 3 devs, ~15 stories | stories-only |
| Vendor | In-house | flexible |

→ Recommended: **stories-only**. Rationale: small + iterative + no PM +
no audit.

---

## Anti-example

| Q | Answer | "Default" choice |
| --- | --- | --- |
| Delivery mode | Continuous | (ignored) |
| Audit | HIPAA | (ignored) |
| PM | Yes | (ignored) |
| Team | 10 devs | (ignored) |
| Vendor | In-house | (ignored) |

→ BA default reflex: "always srs-only because that's what BABOK
teaches".
→ ❌ Wrong. HIPAA = compliance flag, nhưng product-led + iterative
context phù hợp `prd-stories` với NFR compliance section + audit trail
mechanism trong stories.

**Lesson:** decision matrix, không phải default reflex.
