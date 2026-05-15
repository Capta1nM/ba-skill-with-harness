# Per-Engagement Agents

Đây là 12 sub-agent .md riêng cho engagement này, copied từ
`~/.claude/skills/ba-skill/agents/` bởi bootstrap script.

Đã substitute placeholder:
- `{ENGAGEMENT_NAME}` → tên engagement.
- `{METHODOLOGY}` → methodology từ `.project-config.yml`.

## 12 agents

| Agent | Phase | Dispatch khi |
| --- | --- | --- |
| ba-intake-classifier | P0 | Mọi request mới |
| ba-elicitation-prep-builder | P1 | "phỏng vấn ai", "workshop", "elicitation plan" |
| ba-session-capturer | P2 capture | "transcript", "note họp", "email", "process notes" |
| ba-requirement-analyst | P2 analyze | "promote RAW", "build REQ catalog" |
| ba-domain-modeler | P3 | "glossary", "context map", "module", "scope" |
| ba-brd-writer | P4 | "BRD", "business requirement" |
| ba-spec-writer | P5 spec | "SRS", "PRD", "spec functional" |
| ba-story-writer | P5 stories | "epic", "user story", "use case" |
| ba-wireframe-architect | P6 | "wireframe", "screen spec" |
| ba-traceability-keeper | all | "matrix", "trace", "impact" |
| ba-validator | all | "crosscheck", "walkthrough", "signoff", "change request" |
| ba-wiki-health-checker | all | "structure intact?", "health check" |

## Fork rule

Có thể edit agent .md per engagement khi:

- Glossary đặc thù cần inline reference.
- Methodology mới (vd: BABOK strict) thêm rule.
- Tech stack constraint (vd: SRS phải bao trùm OpenAPI spec).

KHÔNG nên fork khi:

- Sửa lỗi general (sửa source skill ở global, re-bootstrap).
- Thay đổi cardinal rule (đó là rule global).
