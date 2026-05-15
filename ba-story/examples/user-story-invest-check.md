# Example — User Story + INVEST Check

## US-001 Create Campaign Task

**Metadata:**
- Epic: EPC-01 Task Capture
- Module: MOD-TaskCapture
- Priority: must
- Trace: BR-6.1, SR-4.1.1, REQ-001, REQ-005.

### Story

> As a Marketing Coordinator
> I want to create a campaign task with title, owner, campaign, phase,
>   and due date
> So that the team sees the task in the backlog within seconds

### Acceptance Criteria

| AC ID | Scenario | Given | When | Then |
| --- | --- | --- | --- | --- |
| AC-1 | Happy path | logged-in coordinator on Marketing Campaign X | submit task with title="Q3 launch brief", owner=STK-002a, phase=brief, due=2026-06-30 | task created, appears in MOD-Visibility backlog within 2s, event TaskCreated emitted |
| AC-2 | Missing title | logged-in coordinator | submit without title | error message "Title is required", task NOT created |
| AC-3 | Past due date | logged-in coordinator | submit with due_date=2026-05-01 (past) | error "Due date must be today or later" |
| AC-4 | Closed campaign | coordinator selects closed Campaign Y | submit | error "Cannot create task in closed campaign" |
| AC-5 | Unauthorized | non-coordinator user | submit | error 403 + task NOT created |

### INVEST check

| Letter | Pass? | Note |
| --- | --- | --- |
| Independent | yes | No story depends on this beyond US-002 (assign) |
| Negotiable | yes | UI layout open for Phase 6 |
| Valuable | yes | OBJ-02 metric (time-to-create) improves |
| Estimable | yes | Tech lead confirmed |
| Small | yes | 1 sprint estimated |
| Testable | yes | 5 AC, all Given/When/Then |

### UI / Wireframe

- SCR-TaskCreate (Phase 6).

### NFR touches

- Performance: response p95 < 2s (NFR-001).
- Security: input validation server-side (NFR-007).

### Out-of-scope for this story

- Auto-fill due date dựa campaign timeline (story riêng US-014).
- Bulk import từ CSV (defer v2).

### Open questions

- (resolved) Email/Slack auto-import? → out-of-scope, defer v2.

---

## Anti-example

❌ Bad story:

```markdown
US-001:
As a user, I want to create a task and assign it and notify and report.

AC:
- System works.
- No bugs.
```

INVEST check:
- ❌ Independent — depends on Assign + Notify + Report (4 features ép vào).
- ❌ Valuable — outcome không rõ.
- ❌ Estimable — quá to.
- ❌ Small — không thể done in 1 sprint.
- ❌ Testable — "System works" không testable.

Fix: split thành 4 story riêng (Create / Assign / Notify / Report).
Mỗi story 1 outcome rõ, AC Given/When/Then.

## Bài học

- "As a user" → cụ thể role (Marketing Coordinator).
- AC = test case, không phải mong ước chung.
- Story to → split, đừng chấp nhận "kỹ thuật build từ to xuống nhỏ".
