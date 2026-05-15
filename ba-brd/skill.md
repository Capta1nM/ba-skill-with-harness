---
name: ba-brd
description: Phase 4 skill. Write BRD (Business Requirements Document). Mỗi section trace ≥1 REQ. Metric đo được. KHÔNG design/UI decision trong BRD body. Sign-off evidence ở docs/validation/.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-brd — Phase 4 Skill

## Mục đích

Locked business contract: cái gì xây, cho ai, vì sao, đo thành công thế
nào.

## Workflow

```text
1. Read requirements/analyzed/ + domain/scope.md + domain/modules/
        |
        v
2. Outline BRD draft (CHƯA full content)
        Trình outline cho user review:
        Section list + ID trace per section.
        |
        v (user confirm)
3. Draft full docs/brd/brd.md theo template
        Pass DoR checklist-brd.md.
        |
        v
4. Cross-check BRD vs REQ catalog
        Forward: mọi must REQ → trong BRD?
        Backward: mọi BR-X.X → ≥1 REQ?
        Output: docs/validation/<date>-crosscheck-brd.md
        |
        v (fix findings)
5. Circulate review
        |
        v
6. Sponsor sign-off
        Capture docs/validation/<date>-signoff-brd.md
        Status BRD → signed-off.
        |
        v
7. Update TRACEABILITY_MATRIX (cột BRD)
```

## Section structure

| # | Section | Notes |
| --- | --- | --- |
| 1 | Executive Summary | 1 trang stand-alone |
| 2 | Business Context | Background, problem, opportunity |
| 3 | Objectives & Metrics | OBJ-XX với baseline + target + measurement method |
| 4 | Stakeholders | Link stakeholders.md, summary primary + authority |
| 5 | Scope | In/out, assumptions, constraints, dependencies |
| 6 | High-Level Business Requirements | BR-X.X table với MoSCoW + source REQs + module |
| 7 | Non-Functional Business Requirements | Performance, availability, security, accessibility, compliance, privacy, localization |
| 8 | Business Process View | High-level flow (diagram) |
| 9 | Risks | RSK-XX với likelihood, impact, mitigation, owner |
| 10 | Success & Acceptance | Evidence sponsor sẽ look for |
| 11 | Glossary | Link domain/glossary.md |
| 12 | Open Issues | Issue + owner + target |

## Metric measurability

Mỗi OBJ phải có:

- Baseline (current state).
- Target (desired state).
- Measurement method (cách đo).

✅ "Reduce missed deadlines from 28% to 14% in 3 months, measured by
   count(tasks completed after due_date) / count(tasks total) monthly."

❌ "Improve customer satisfaction."
❌ "Make the system better."
❌ "Reduce errors significantly."

## BR atomic + trace rule

Mỗi BR-X.X:

- 1 sentence business-language.
- Priority MoSCoW.
- Source REQ IDs list.
- Module assignment.

KHÔNG:

- And-join 2 business outcome.
- Mention specific tech ("API", "DB").
- UI/design ("button", "screen", "form").

## NFR section coverage

7 attribute bắt buộc xét. Skip attribute → ghi explicit "Not applicable
because <reason>".

| Attribute | Examples of thresholds |
| --- | --- |
| Performance | Response time p95, throughput per second |
| Availability | Uptime %, max downtime per incident |
| Security | Auth requirements, encryption, access control level |
| Accessibility | WCAG level, keyboard support, screen reader |
| Compliance | GDPR, HIPAA, PCI, SOX, etc. |
| Privacy / Retention | Data retention period, deletion policy |
| Localization | Languages, timezone, currency |

## Sign-off evidence

KHÔNG signed-off "informally". Bắt buộc:

```markdown
# docs/validation/2026-05-30-signoff-brd.md

Signing role: Marketing Lead (STK-001)
Date: 2026-05-30
Scope: BRD v1.0, sections 1-12.
Conditions: Legal review pending on retention NFR (sec 7.6) — track
            as open issue, OK to proceed with BRD v1.0 as agreed.
```

## Anti-patterns

- ❌ BR mention specific tech.
- ❌ Metric không đo được.
- ❌ Skip NFR attribute (đặc biệt compliance + privacy).
- ❌ BR-X.X không trace REQ.
- ❌ Sign-off informal qua chat / email không file evidence.
- ❌ BRD "agreed" trong khi REQ source vẫn draft.
