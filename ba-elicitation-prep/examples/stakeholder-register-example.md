# Example — Stakeholder Register

Context: engagement nội bộ — Marketing Task Tool (demo).

## Primary

| ID | Role | Org | Interest | Influence | Decision power | Communication | Availability |
| --- | --- | --- | --- | --- | --- | --- | --- |
| STK-001 | Marketing Lead | Marketing | Sponsor, owns budget | H | Final scope decision | Email + Slack | 30min/tuần |
| STK-002 | Marketing Coordinator (×3) | Marketing | Daily users | H | Workflow detail | In-person workshop | 2h/tuần |
| STK-003 | IT Operations Lead | IT | Deployment + infra | M | Infra constraints | Email | 1h/2 tuần |

## Secondary

| ID | Role | Why involved | Interest | Influence |
| --- | --- | --- | --- | --- |
| STK-101 | Legal | Privacy review (data retention) | M | M |
| STK-102 | InfoSec | Access control review | L | M |

## Excluded with reason

| ID | Group | Reason |
| --- | --- | --- |
| STK-201 | Finance | Internal tool, no billing impact, no budget approval needed beyond sponsor. |
| STK-202 | Support | Internal use, no external user support. |
| STK-203 | Sales | Not customer-facing. |

## Influence/Interest map

```text
                High Interest
                     |
        STK-101      |   STK-001
        Legal        |   Mktg Lead
        (Manage)     |   (Manage Closely)
       --------------+----------------
        STK-102      |   STK-002
        InfoSec      |   Coordinators
        (Monitor)    |   (Keep Informed)
                     |   STK-003 IT Ops
                     |   (Keep Satisfied)
                Low Interest
       Low ----- Influence ----- High
```

## Anti-example

❌ Original BA draft skip Legal:
> "Internal tool, no privacy concern, skip Legal."

Lỗi: ignore secondary group without explicit reason. Marketing có thể
collect leads email → privacy concern → Legal review cần thiết.

✅ Đúng: explicitly include STK-101 Legal trong primary review, hoặc
ghi vào "Excluded with reason" với lý do verified ("không thu thập PII").
