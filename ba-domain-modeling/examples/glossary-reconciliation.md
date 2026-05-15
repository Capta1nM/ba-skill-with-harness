# Example — Glossary Reconciliation

## Scenario: Marketing Task Tool

3 raw notes có từ "owner" với nghĩa khác nhau:

```text
MN-2026-05-14-mkt-lead:
  STK-001: "Owner là người chịu trách nhiệm campaign."

MN-2026-05-15-coord-a:
  STK-002a: "Owner là người làm task đó."

MN-2026-05-20-it-ops:
  STK-003: "Owner trong database là user_id của người tạo."
```

3 nghĩa khác nhau, cùng 1 từ.

## Reconciliation

### Step 1: Document collision in glossary

```markdown
# Glossary — Project

## Owner (⚠️ COLLISION — needs reconciliation)

Term hiện được dùng với 3 nghĩa khác nhau:

- **Context Marketing (STK-001):** Người chịu trách nhiệm tổng thể
  1 campaign. 1 campaign có 1 owner.
- **Context Task (STK-002a):** Người làm 1 task cụ thể. 1 task có
  1 owner (có thể khác per task trong cùng campaign).
- **Context System (STK-003):** Field `user_id` của creator trong DB.

→ Reconciliation needed. Schedule session với cả 3 stakeholder hoặc
sponsor quyết.
```

### Step 2: Reconciliation session

Workshop 30min với STK-001, STK-002a, STK-003.

Outcome: split term thành 2.

### Step 3: Update glossary

```markdown
## Campaign Owner

Người chịu trách nhiệm tổng thể 1 campaign. 1 campaign có 1 Campaign
Owner. Field `campaign_owner_id` trong data model.

Source: MN-2026-05-14-mkt-lead, reconciliation session 2026-05-21.
Synonyms: (none)

## Task Owner

Người làm 1 task cụ thể trong campaign. 1 task có 1 Task Owner. Có
thể khác với Campaign Owner. Có thể đổi qua reassignment.

Source: MN-2026-05-15-coord-a, reconciliation session 2026-05-21.
Synonyms: (none)

Counter-example: KHÔNG dùng "Owner" trần. Luôn dùng "Campaign Owner"
hoặc "Task Owner".
```

### Step 4: Update downstream RAW + REQ

Tìm mọi RAW/REQ có "owner" trần → update với context rõ.

```text
RAW-001 cũ: "Tao copy task từ email vô spreadsheet."
  (không có "owner" → không cần update)

RAW-008 cũ: "Task được assign cho owner."
  → update: "Task được assign cho Task Owner."

REQ-001 cũ: "...with required fields title, owner, campaign, phase..."
  → update: "...with required fields title, Task Owner, campaign,
    phase..."
```

### Step 5: Log decision (vì impact ≥1 module)

```markdown
# 0004 — Split "Owner" → "Campaign Owner" + "Task Owner"

Date: 2026-05-21
Status: Accepted

## Context

3 stakeholder dùng "Owner" với nghĩa khác nhau (campaign role / task
role / DB field). Risk: downstream artifact ambiguous.

## Decision

Split thành 2 term: "Campaign Owner" (1 per campaign), "Task Owner" (1
per task). DB field "user_id" giữ nguyên là technical detail, không
phải business term.

## Affected Artifacts

- RAW-008, RAW-013 — update wording.
- REQ-001, REQ-004 — update wording.
- Glossary updated.

## Alternatives Considered

1. Giữ "Owner" trần, để context tự suy → rejected: gây ambiguous trong
   BRD/SRS.

## Consequences

Positive: clear in downstream.
Tradeoffs: thêm 1 từ trong vocab.
```

## Vì sao tốt

- KHÔNG silent merge.
- 3 nghĩa được document trước khi pick.
- Reconciliation session có evidence.
- Downstream update đầy đủ.
- ADR log decision (impact ≥1 module).

## Anti-example

❌ Bad reconciliation:

BA thấy 3 nghĩa khác nhau, tự chọn nghĩa của STK-001 (sponsor) làm
canonical, update glossary thành "Owner = Campaign Owner". Update REQ-001
silent. Không log decision.

Lỗi:
- STK-002a + STK-003 không được hỏi → 2 stakeholder mất voice.
- Downstream REQ giờ ambiguous: "owner" trong "Task Owner" có còn dùng
  được không?
- Khi audit hỏi sao chọn nghĩa Sarah, không trả lời được.

→ Reconciliation phải explicit, có session, có ADR.
