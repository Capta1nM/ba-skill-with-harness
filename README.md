# ba-skill

Global skill library + per-engagement project template cho Business Analyst
làm việc với AI agent.

Kế thừa concept từ [`java-skill`](../java-skill) cho backend Java, áp dụng
cho domain BA: elicitation → requirements → BRD → SRS/PRD → wireframes.

Giữ nguyên nguyên tắc cốt lõi từ [`harness-ba`](../../harness-ba) (sẽ
deprecated sau khi `ba-skill` ổn định).

## Triết lý

- **Skills là global** — kiến thức chung về cách viết BRD, US, SRS,
  wireframe, traceability. Cài 1 lần vào `~/.claude/skills/`, mọi
  engagement đều dùng.
- **Agents là per-engagement** — orchestrator + sub-agents biết
  methodology nào đã chọn, glossary nào, scope nào, sống ở
  `<engagement>/.claude/agents/`. Bootstrap copy vào.
- **Project template là per-engagement** — workspace của engagement
  (`docs/` chứa intake, elicitation, requirements, domain, brd, srs,
  stories, wireframes, validation, decisions, memory, templates,
  prompt).
- **State on disk, không trong chat** — mọi câu hỏi, quyết định, raw
  material phải có địa chỉ trên đĩa.

## Cấu trúc

```text
ba-skill/
  README.md                         file này
  PLAN.md                           kế hoạch xây dựng + decisions locked
  GETTING_STARTED.md                cho BA mới hoàn toàn
  MIGRATION.md                      từ harness-ba sang ba-skill
  install.sh / install.bat / install.ps1
  
  ba-architecture/                  ⭐ orchestrator skill (global)
    skill.md
    checklist/                      master + per-artifact checklists
  
  ba-elicitation-prep/              P1
  ba-elicitation-capture/           P2 (note + session log)
  ba-requirement-analysis/          P2 (raw → REQ)
  ba-domain-modeling/               P3 (glossary, context, modules, scope)
  ba-brd/                           P4
  ba-spec/                          P5 (SRS hoặc PRD)
  ba-story/                         P5 (epic + US + use case)
  ba-wireframe/                     P6
  ba-traceability/                  cross-cutting (matrix)
  ba-validation/                    cross-cutting (CR + signoff + crosscheck)
  ba-methodology/                   P5 entry decision (SRS/PRD/US choice)
  
  agents/                           12 per-engagement agent .md (bootstrap copy)
  examples/                         walkthrough + reference examples (global)
  
  project-template/                 ⭐ bootstrap copy vào mỗi engagement
    bootstrap.sh / .bat / .ps1
    _project-root/                  AGENTS.md, CLAUDE.md, .project-config.yml, .claude/
    docs/                           engagement workspace
      WORKFLOW.md, RISK_LANES.md, TRACEABILITY_MATRIX.md, QUALITY_GATES.md,
      GLOSSARY.md, HARNESS_BACKLOG.md
      decisions/, memory/
      elicitation/, requirements/, domain/
      brd/, srs/, stories/, wireframes/, validation/
      templates/, prompt/
```

## Cài đặt

### 1. Cài skills global (1 lần / máy)

```bash
cd D:\workspace\my_workspace\ai\skill\ba-skill
bash install.sh
# hoặc trên Windows: install.bat / install.ps1
```

Sẽ copy:
- `ba-architecture/`, `ba-*/` → `~/.claude/skills/`
- `project-template/` → `~/.claude/skills/project-template/`
- **KHÔNG** copy agents vào `~/.claude/agents/` (agents đi theo engagement)

### 2. Bootstrap 1 engagement (mỗi engagement 1 lần)

```bash
bash ~/.claude/skills/project-template/bootstrap.sh /path/to/my-engagement \
  --engagement-name="marketing-task-tool" \
  --methodology=undecided
```

Sẽ tạo:
- `<engagement>/AGENTS.md`, `CLAUDE.md`, `.project-config.yml`
- `<engagement>/.claude/agents/*.md` ← 12 agents copy từ `agents/`
- `<engagement>/docs/*` ← workspace skeleton

### 3. Mở engagement, bắt đầu

```bash
cd /path/to/my-engagement
# Mở Claude Code, paste prompt từ docs/prompt/ba/template/00-kickoff.md
```

## Tiếp theo

- **Người mới:** đọc `GETTING_STARTED.md`.
- **Migration từ harness-ba:** đọc `MIGRATION.md`.
- **Hiểu kế hoạch xây ba-skill:** đọc `PLAN.md`.
- **Xem ví dụ end-to-end:** đọc `examples/walkthrough.md`.

## Status

Đang trong giai đoạn build (B1-B7 theo PLAN.md). Chưa nên dùng cho
production engagement cho đến khi B7 hoàn tất và có 1 engagement test
chạy thông.

Trong thời gian chờ, dùng [`harness-ba/`](../../harness-ba) (vẫn live).
