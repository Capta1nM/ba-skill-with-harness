# Example — Elicitation Plan

Context: Marketing Task Tool, 3 tuần Phase 1+2.

## Objectives

- Confirm scope với Marketing Lead.
- Capture current workflow từ 3 coordinator.
- Verify IT/Legal/Security constraints.

## Techniques in use

| Technique | Use? | Why | Lead |
| --- | --- | --- | --- |
| Interview 1:1 | Yes | Coordinator có workflow khác nhau, capture cá nhân | BA |
| Workshop | Yes | Align scope + prioritize features với cả 4 mkt + 1 IT | BA |
| Observation | No | Workflow đơn giản, không cần shadow | — |
| Document review | Yes | Spreadsheet hiện tại + Email template | BA |
| Survey | No | Stakeholder ít (5 người), face-to-face hiệu quả hơn | — |

## Session plan

| SES ID | Stakeholder(s) | Technique | Objective | Output | Week |
| --- | --- | --- | --- | --- | --- |
| SES-2026-05-14-mkt-lead | STK-001 | Interview | Confirm scope + objectives | Scope draft | W1 |
| SES-2026-05-15-coord-a | STK-002a | Interview | Current workflow | Raw notes | W1 |
| SES-2026-05-16-coord-b | STK-002b | Interview | Current workflow | Raw notes | W1 |
| SES-2026-05-17-coord-c | STK-002c | Interview | Current workflow | Raw notes | W1 |
| SES-2026-05-20-it-ops | STK-003 | Interview | Infra constraints | Constraints list | W2 |
| SES-2026-05-22-workshop | STK-001,002a,b,c,003 | Workshop | Prioritize + reconcile | MoSCoW list | W2 |
| SES-2026-05-26-legal | STK-101 | Interview | Privacy review | Compliance NFR | W3 |
| SES-2026-05-27-infosec | STK-102 | Interview | Access control | Security NFR | W3 |

## Dependencies

- SES-2026-05-14-mkt-lead **trước** SES coordinator (cần scope ước
  lượng).
- SES coordinator **trước** workshop (workshop dựa raw data).
- SES-2026-05-22-workshop **trước** legal/infosec (cần scope rõ).

## Timeline

```text
Week 1: Interview với sponsor + 3 coordinator.
Week 2: IT ops + reconciliation workshop.
Week 3: Legal + InfoSec review.
Week 4: Phase 3 (Domain Mapping).
```

## Risks

| Risk | Likelihood | Impact | Mitigation |
| --- | --- | --- | --- |
| Coordinator available limited | H | M | Schedule ≥2 tuần trước, async follow-up cho missed |
| Glossary drift (4 mkt người dùng từ khác) | H | H | Reconciliation activity trong workshop W2 |
| Legal review pending → block BRD | M | H | Schedule Legal sớm W3, không đợi cuối |

## Exit criteria sang P3

- Mọi primary stakeholder ≥1 session held hoặc deferred-with-reason.
- Raw statements parked với source.
- Follow-up questions tracked.
- Workshop output → MoSCoW priority list draft.

## Anti-example

❌ Plan cũ: "1 interview với sponsor, dùng output để viết BRD luôn".
- Skip coordinator → workflow assumption không kiểm chứng.
- Skip workshop → 4 người mkt sẽ disagree trong BRD review.
- Skip Legal → BRD sign-off pending.

✅ Đúng: như plan trên, 8 session 3 tuần, build evidence base.
