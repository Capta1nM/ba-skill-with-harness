---
name: ba-spec
description: Phase 5 skill. Write SRS hoặc PRD (theo methodology decision). KHÔNG implementation detail (DB schema, framework). Mỗi clause/capability trace BRD section + REQ IDs. NFR đầy đủ 7 attribute.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-spec — Phase 5 Specification Skill

## Tiền đề

Methodology decision đã log. Đọc `.project-config.yml` mục `methodology`:

| Value | Output |
| --- | --- |
| `srs-only` | docs/srs/srs.md theo template srs.md |
| `prd-stories` | docs/prd/prd.md theo template prd.md (cộng `ba-story` cho stories) |
| `stories-only` | Skip skill này, chuyển sang `ba-story` thẳng |
| `undecided` | DỪNG. Trigger `ba-methodology` trước. |

## Workflow

```text
1. Verify methodology decision đã log
        |
        v
2. Outline spec (CHƯA ghi full)
        Section list + ID scheme (SR-X.X.X hoặc CAP-XX)
        Trình user review.
        |
        v (user confirm)
3. Draft full file theo template
        Pass DoR checklist-srs hoặc checklist-prd
        |
        v
4. Cross-check vs BRD
        Mọi BR-X.X có ≥1 SR/CAP cover?
        Mọi SR/CAP có ≥1 BR source?
        |
        v (fix findings)
5. Tech lead review (buildability)
        Product owner review (intent preserved)
        |
        v
6. Sign-off evidence + status signed-off
        |
        v
7. Update TRACEABILITY_MATRIX (cột SRS/PRD)
```

## SRS-only structure

8 section (IEEE-style):

1. Introduction (purpose, scope, definitions, references)
2. Overall Description (perspective, users, environment, constraints,
   assumptions)
3. External Interface (UI cross-ref wireframes, hardware, software,
   communication)
4. Functional Requirements (grouped by module, SR-X.Y.Z với trace BR
   + REQ, inputs, processing, outputs, error handling, AC)
5. Non-Functional Requirements (performance, availability, security,
   accessibility, compliance, maintainability, i18n/l10n, retention,
   audit)
6. Data Requirements (entities, migration, reporting)
7. Use Cases (link tới UC files)
8. Open Issues

## PRD structure

11 section (product-led):

1. Product Summary
2. Vision & Strategic Fit
3. Personas (trace stakeholder)
4. Outcomes (OUT-XX với metric)
5. Capabilities (CAP-XX với epic dự kiến)
6. User Journeys
7. NFR (7 attribute)
8. Release Plan (MVP + R2)
9. Out-of-scope
10. Risks
11. Glossary reference

## Clause/capability rule

- Mỗi clause/capability ID stable (SR-X.Y.Z hoặc CAP-XX).
- Trace lên BR + REQ.
- Trace xuống epic/story dự kiến.
- KHÔNG implementation detail.
- Acceptance Given/When/Then (cho SR).

## NFR coverage (cả SRS và PRD)

| Attribute | Threshold examples |
| --- | --- |
| Performance | Response time p50/p95, throughput, concurrent users |
| Availability | Uptime %, RTO, RPO |
| Security | Auth, encryption, audit, access control level |
| Accessibility | WCAG level, keyboard, screen reader |
| Compliance | GDPR, HIPAA, PCI, regional |
| Maintainability | Tech debt budget, test coverage % |
| Localization | Languages, currencies, timezone, RTL |
| Retention | Per data class: retention period, deletion policy |
| Auditability | Audit event list, log retention |

Skip attribute → ghi explicit "Not applicable because <reason>".

## Open issues vs Risks

- Open issue: ambiguity còn lại, cần resolve trước launch.
- Risk: known threat to objective, có mitigation, có owner.

Skip 1 trong 2 = artifact incomplete.

## Anti-patterns

- ❌ Draft trước khi methodology log.
- ❌ Implementation detail (framework, DB schema, API endpoint).
- ❌ SR clause restate REQ không thêm precision.
- ❌ NFR threshold "fast enough".
- ❌ AC không testable.
- ❌ Skip section "Open Issues" để workflow nhanh.
