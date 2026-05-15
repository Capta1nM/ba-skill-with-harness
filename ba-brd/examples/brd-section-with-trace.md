# Example — BRD Section with Trace

## Section 6: High-Level Business Requirements (excerpt)

```markdown
## 6. High-Level Business Requirements

| BR ID | Business Requirement | Priority | Source REQs | Module |
| --- | --- | --- | --- | --- |
| BR-6.1 | Coordinators capture campaign tasks with required fields in <1 min | must | REQ-001, REQ-005 | MOD-TaskCapture |
| BR-6.2 | Team sees overdue tasks without asking lead | must | REQ-002, REQ-006 | MOD-Visibility |
| BR-6.3 | Coordinators reassign task ownership when needed | should | REQ-003 | MOD-TaskCapture |
| BR-6.4 | Tasks progress through 4 phases (brief → draft → review → publish) sequentially | must | REQ-004, REQ-009 | MOD-TaskCapture |
| BR-6.5 | Marketing Lead exports monthly on-time report | could | REQ-018 | MOD-Reporting |
```

## Section 3: Objectives & Metrics (excerpt)

```markdown
## 3. Objectives & Success Metrics

| OBJ ID | Objective | Metric | Baseline | Target | Measurement Method | Owner |
| --- | --- | --- | --- | --- | --- | --- |
| OBJ-01 | Reduce missed campaign deadlines | count(tasks completed after due_date) / count(tasks) | 28% (3-month avg) | ≤14% | Monthly report from task DB | STK-001 Mktg Lead |
| OBJ-02 | Reduce time-to-create-task | median seconds from "click new" to "task saved" | ~3 min (spreadsheet copy) | <60 sec | Application telemetry | BA + Tech Lead |
| OBJ-03 | Increase task ownership clarity | count(tasks with single named owner) / count(tasks total) | 71% (spreadsheet audit) | ≥95% | Monthly report | STK-001 |
```

## Vì sao tốt

- BR atomic, business-language, không mention tech.
- Mỗi BR có source REQ IDs.
- Mỗi BR có module assignment.
- Priority MoSCoW rõ.
- OBJ có baseline + target + measurement method.

## Anti-example

❌ Bad BRD section:

```markdown
| BR-6.1 | System uses React + Redis cache to provide fast task capture | must | (no source) |
```

Lỗi:
- "React + Redis" = tech decision (thuộc SRS/architecture, không BRD).
- "Fast" không định lượng.
- Không source REQ.

❌ Bad OBJ:

```markdown
| OBJ-01 | Improve user satisfaction | high | now | better | survey |
```

Lỗi:
- Baseline "now" không phải số.
- Target "better" không định lượng.
- Measurement "survey" — survey nào, câu hỏi nào, threshold bao nhiêu?
