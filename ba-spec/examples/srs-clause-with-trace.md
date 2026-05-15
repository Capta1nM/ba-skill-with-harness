# Example — SRS Clause with Trace

## SR-4.1.1 Create Campaign Task

**Trace:** BR-6.1, REQ-001, REQ-005.

**Module:** MOD-TaskCapture.

### Description

Coordinator tạo task mới gắn vào campaign hiện tại, gán Task Owner,
phase ban đầu, due date.

### Inputs

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| title | string(1-200) | yes | non-empty, trim |
| campaign_id | reference Campaign | yes | exists in MOD-CampaignManagement |
| task_owner_id | reference User | yes | active user, role in {coordinator, lead} |
| phase | enum(brief, draft, review, publish) | yes | default brief |
| due_date | date | yes | >= today |
| description | string(0-2000) | no | trim |

### Processing

1. Validate inputs theo bảng trên.
2. Check campaign status = active.
3. Persist task với phase=brief, status=open, created_at=now.
4. Emit event TaskCreated với task_id + owner_id (consumed by
   MOD-Visibility, MOD-Notification).

### Outputs

- Success: task_id + persisted task object.
- Validation failure: error code + field-specific message.
- Auth failure: 401.
- Authz failure: 403 (user không phải coordinator của campaign).

### Error handling

| Code | Khi nào |
| --- | --- |
| ERR-001 | title rỗng/quá dài |
| ERR-002 | campaign không tồn tại hoặc closed |
| ERR-003 | task_owner_id không active |
| ERR-004 | due_date trong quá khứ |
| ERR-005 | user không có quyền tạo task cho campaign này |

### Acceptance

- Given a coordinator authenticated in campaign X, when they submit
  valid inputs, then task is created, visible in backlog within 2s,
  event TaskCreated emitted.
- Given missing title, when submit, then ERR-001 returned.
- Given campaign closed, when submit, then ERR-002 returned.
- Given due_date in past, when submit, then ERR-004 returned.

## Vì sao tốt

- Trace lên BR + REQ rõ.
- Inputs có table chi tiết với type/required/validation.
- Processing steps rõ.
- Error code explicit, không chỉ "validation failed".
- AC Given/When/Then testable.
- KHÔNG mention framework (Spring, FastAPI), DB schema (table name),
  hoặc UI ("button color").

## Anti-example

❌ Bad SR clause:

```markdown
## SR-4.1.1 Create Task

REST API POST /api/tasks. Use Spring @PostMapping. Save vào PostgreSQL
table campaign_tasks. Return JSON với task_id. Add Redux action
CREATE_TASK_SUCCESS.
```

Lỗi:
- REST, Spring, PostgreSQL, Redux = implementation detail.
- Không trace BR/REQ.
- Không có Inputs/Processing/Outputs/Errors/AC schema.
- KHÔNG buildable: dev không biết validation rule.

→ Push back. SR clause phải behavior-level, KHÔNG tech.
