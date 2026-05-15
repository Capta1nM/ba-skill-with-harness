# Memory Entry Template

```markdown
---
id: MEM-<NNN>
date: YYYY-MM-DD
type: rule | preference | warning | learning
status: active | retired
trigger: <when this applies>
---

## Rule

<concise rule statement>

## Why

<reason — usually a past incident or strong stakeholder preference>

## How to apply

<when this rule kicks in during agent dispatch / artifact creation>

## Affected skills / agents

<list>

## Source

- Session: SES-XXX (if from session)
- User feedback: <quote>
- Friction observed: <count>

## Related

- [[MEM-XXX]] (other related memory entries)

## History

- YYYY-MM-DD: added.
```

## Examples

### Example 1: rule

```markdown
---
id: MEM-001
date: 2026-05-15
type: rule
status: active
trigger: drafting BRD section 7 (Non-Functional)
---

## Rule

Always include Legal review checkpoint for any engagement that touches
customer data, even when "no PII collected" assumed.

## Why

Sponsor STK-001 marked compliance as "low priority" in intake, but
Legal review later found GDPR implications from cookie storage.
Almost delayed BRD signoff by 2 weeks.

## How to apply

When intake risk-flag "compliance" = unticked, ba-intake-classifier
should still ask Q: "Does the system touch any user data
(behavioral, identity, payment)?" before final classification.

## Affected skills / agents

- ba-intake-classifier
- ba-brd (checklist-brd.md NFR section)

## Source

- Friction observed: 1 (almost-blocked signoff)

## History

- 2026-05-15: added by BA1.
```

### Example 2: preference

```markdown
---
id: MEM-002
date: 2026-05-20
type: preference
status: active
trigger: writing user stories
---

## Rule

This sponsor (STK-001) prefers AC in plain Vietnamese, not English
Given/When/Then.

## Why

Sponsor explicitly said in walkthrough: "tao đọc tiếng Anh AC mệt
lắm, viết tiếng Việt cũng được."

## How to apply

ba-story-writer use Vietnamese phrasing for AC: "Khi <điều kiện>...
Thì <kết quả>...".

## Affected skills / agents

- ba-story (template)
- ba-story-writer

## History

- 2026-05-20: added.
```
