# PLAN — Xây dựng `ba-skill` theo concept `java-skill`

Status: **locked, executing**
Date: 2026-05-15

## Decisions locked (2026-05-15)

| # | Decision |
| --- | --- |
| Q1 | Agents per-project (in `<engagement>/.claude/agents/`). Skills global. |
| Q2 | Workspace folder name: `docs/` (KHÔNG dùng `wiki/`). Khác java-skill, giữ tên quen từ harness-ba. |
| Q3 | Methodology optional khi bootstrap, default `undecided`. Phase 5 sẽ force quyết. |
| Q7 | Prompt library move vào `project-template/docs/prompt/ba/template/`. Per-engagement, có thể tune. |
| Q9 | `harness-ba/` giữ + mark deprecated (README.md báo "moved to ba-skill"). |
| Q4 | Orchestrator được dùng AskUserQuestion (như java-architecture). |
| Q5 | `wiki-health-check` (rename → `docs-health-check`) bật mặc định, confirm trước mỗi auto-repair. |
| Q6 | Memory per-engagement only ở `docs/memory/MEMORY.md`. KHÔNG sync global. |
| Q8 | Bootstrap script: bash + bat + ps1. |
| Q10 | Prompt move ngay B5. |

→ Mọi reference đến `wiki/` trong PLAN này = `docs/`.

---

## 0. Mục tiêu

Chuyển `harness-ba` (monolithic repo, mọi thứ trong 1 folder) thành `ba-skill`
(skill library + project template + per-project agents) theo cùng concept với
`java-skill`, **trong khi giữ nguyên nguyên tắc cốt lõi của `harness-ba`**:

- 6 phase BA workflow.
- State on disk, không trong chat.
- Cardinal Rules (no requirement without source, no artifact without
  traceability, no wireframe ahead of SRS, ask before SRS vs PRD vs US,
  glossary owns names).
- Traceability matrix là control panel, không phải deliverable.
- Quality gates DoR/DoD cho từng artifact.
- "Dump first, structure later" cho raw notes.

## 1. Nguyên tắc kiến trúc

### 1.1 Skills global, Agents per-project (deviation từ java-skill)

| | Skills | Agents | Project template |
| --- | --- | --- | --- |
| **Vị trí cài** | `~/.claude/skills/` (hoặc `~/.agents/skills/` qua npx) | `<project>/.claude/agents/` | `<project>/` |
| **Phạm vi** | Global, mọi engagement dùng chung | Riêng từng engagement | Riêng từng engagement |
| **Cập nhật** | Update 1 lần, mọi engagement hưởng lợi | Mỗi engagement tự fork/tune nếu cần | Stable, scaffold 1 lần khi tạo engagement |
| **Lý do** | Rules + checklists là kiến thức chung | Methodology, stakeholder, glossary khác nhau mỗi engagement | Đây là workspace của engagement |

Khác java-skill (agents global): BA mỗi engagement có context khác hẳn nhau
(domain, stakeholder, methodology shape, glossary). Agents per-project cho
phép tune từng engagement mà không ảnh hưởng engagement khác.

### 1.2 Source-of-truth order (per-project AGENTS.md sẽ neo)

```text
1. .project-config.yml (engagement root) — auto-discovered
2. <engagement>/AGENTS.md — project-wide master rules
3. <engagement>/CLAUDE.md — Claude-specific addendum
4. <engagement>/wiki/RISK_LANES.md
5. <engagement>/wiki/WORKFLOW.md
6. <engagement>/wiki/TRACEABILITY_MATRIX.md
7. <engagement>/wiki/QUALITY_GATES.md
8. <engagement>/wiki/memory/MEMORY.md — feedback rules đã học
9. <engagement>/wiki/GLOSSARY.md
10. ~/.claude/skills/ba-* — coding rules per concern (global)
11. ~/.claude/skills/ba-architecture/checklist/ba-checklist.md — master
12. <engagement>/.claude/agents/*.md — sub-agent specs (per-project)
```

### 1.3 Orchestrator pattern (theo java-architecture)

`ba-architecture` = thin dispatcher. Main agent chỉ:
- Read context (intake, plan, current state).
- Hiển thị form/TODO/summary.
- Hỏi user.
- Dispatch sub-agent qua Agent tool.
- Tổng hợp output.

Main agent **không tự** write/edit artifact lớn (BRD, SRS, story, wireframe).
Sub-agents per-project làm.

Exceptions giống java-architecture: type=context-query, type=harness-improvement,
type=tiny edit (typo, glossary clarify).

---

## 2. Cây thư mục `ba-skill/` (deliverable)

```text
D:\workspace\my_workspace\ai\skill\ba-skill\
  README.md                                 # giới thiệu
  PLAN.md                                   # file này
  GETTING_STARTED.md                        # cho BA mới
  MIGRATION.md                              # từ harness-ba sang ba-skill
  install.sh / install.bat / install.ps1    # cài skills global
  
  ba-architecture/                          # ⭐ Orchestrator skill (global)
    skill.md
    checklist/
      ba-checklist.md                       # master
      checklist-intake.md
      checklist-stakeholder-register.md
      checklist-elicitation-plan.md
      checklist-interview-guide.md
      checklist-workshop-agenda.md
      checklist-note.md
      checklist-session-log.md
      checklist-raw-statement.md
      checklist-requirement.md
      checklist-glossary.md
      checklist-context-map.md
      checklist-module.md
      checklist-scope.md
      checklist-brd.md
      checklist-prd.md
      checklist-srs.md
      checklist-epic.md
      checklist-user-story.md
      checklist-use-case.md
      checklist-wireframe.md
      checklist-traceability.md
      checklist-validation.md
      checklist-change-request.md
      wiki-health-check.md                  # verify per-engagement structure
  
  # Concern skills (global) — mỗi skill = 1 capability + examples
  ba-elicitation-prep/                      # P1
    skill.md
    examples/
      stakeholder-register-example.md
      elicitation-plan-example.md
      interview-guide-example.md
      workshop-agenda-example.md
  
  ba-elicitation-capture/                   # P2 — note + session log
    skill.md
    examples/
      meeting-note-example.md
      transcript-note-example.md
      session-log-example.md
      raw-extraction-example.md
  
  ba-requirement-analysis/                  # P2 — promote raw → REQ
    skill.md
    examples/
      raw-to-req-promotion.md
      atomic-statement.md
      acceptance-given-when-then.md
      assumption-vs-constraint.md
  
  ba-domain-modeling/                       # P3
    skill.md
    examples/
      glossary-reconciliation.md
      context-map-example.md
      module-card-example.md
      scope-with-reasons.md
  
  ba-brd/                                   # P4
    skill.md
    examples/
      brd-trace-to-req.md
      brd-measurable-metric.md
      brd-non-design-rule.md
  
  ba-spec/                                  # P5 (SRS hoặc PRD)
    skill.md
    examples/
      srs-clause-with-trace.md
      prd-capability-outcome.md
      nfr-thresholds.md
  
  ba-story/                                 # P5 (epic + US + use case)
    skill.md
    examples/
      epic-decomposition.md
      user-story-invest-check.md
      acceptance-given-when-then.md
      use-case-flow.md
  
  ba-wireframe/                             # P6
    skill.md
    examples/
      screen-spec-example.md
      cross-check-srs-vs-wireframe.md
      states-error-empty.md
  
  ba-traceability/                          # cross-cutting
    skill.md
    examples/
      matrix-update-pattern.md
      forward-backward-impact-trace.md
      contradiction-detection.md
  
  ba-validation/                            # cross-cutting
    skill.md
    examples/
      crosscheck-report.md
      walkthrough-evidence.md
      signoff-evidence.md
      change-request-flow.md
  
  ba-methodology/                           # P5 entry decision
    skill.md
    examples/
      srs-vs-prd-vs-us-decision-matrix.md
  
  # Per-project agents (copy vào <project>/.claude/agents/ khi bootstrap)
  agents/
    README.md
    ba-intake-classifier.md
    ba-elicitation-prep-builder.md
    ba-session-capturer.md                  # consume note → session log + RAW
    ba-requirement-analyst.md               # promote raw → REQ
    ba-domain-modeler.md                    # glossary + context map + modules + scope
    ba-brd-writer.md
    ba-spec-writer.md                       # SRS hoặc PRD theo decision
    ba-story-writer.md                      # epic + US + use case
    ba-wireframe-architect.md
    ba-traceability-keeper.md               # maintain matrix
    ba-validator.md                         # crosscheck + walkthrough + signoff
    ba-wiki-health-checker.md               # verify wiki structure intact
  
  # Per-project template (bootstrap copy vào <project>/)
  project-template/
    bootstrap.sh / bootstrap.bat / bootstrap.ps1
    _project-root/
      AGENTS.md                             # project-wide master rules
      CLAUDE.md                             # Claude addendum
      README.md                             # engagement readme
      .project-config.yml                   # auto-discovery
      .claude/
        agents/                             # ← agents copied here by bootstrap
          (placeholder, runtime populated)
    
    wiki/
      WORKFLOW.md                           # 6 phase BA
      RISK_LANES.md                         # = INTAKE.md cũ trong harness-ba
      ARCHITECTURE.md                       # info architecture of BA artifacts
      TRACEABILITY_MATRIX.md
      QUALITY_GATES.md
      GLOSSARY.md                           # engagement-level glossary
      HARNESS_BACKLOG.md
      
      decisions/
        README.md
        _template.md
        0001-harness-first-ba-workflow.md   # from harness-ba (kept)
        0002-six-phase-loop.md
        0003-traceability-as-control-panel.md
      
      memory/
        README.md
        MEMORY.md                           # engagement feedback rules
        _entry-template.md
      
      # Engagement artifact folders (empty skeleton)
      elicitation/
        README.md
        intake/
        notes/
          attachments/
        sessions/
        stakeholders.md                     # template placeholder
        plan.md                             # template placeholder
        guides/
      
      requirements/
        README.md
        raw/
        analyzed/
        catalog.md
      
      domain/
        README.md
        glossary.md
        context-map.md
        modules/
        scope.md
      
      brd/
        README.md
      
      srs/                                  # rename → prd/ nếu chọn PRD shape
        README.md
      
      stories/
        README.md
        backlog.md
        epics/
      
      wireframes/
        README.md
        index.md
        screens/
        assets/
      
      validation/
        README.md
        changesets/
      
      # Artifact templates (mỗi loại 1 file, dùng để scaffold artifact mới)
      templates/
        intake-form.md
        stakeholder-register.md
        elicitation-plan.md
        interview-guide.md
        workshop-agenda.md
        meeting-note.md
        observation-log.md
        question-bank.md
        requirement-item.md
        domain-context-map.md
        module-card.md
        brd.md
        prd.md
        srs.md
        epic.md
        user-story.md
        use-case.md
        wireframe-screen-spec.md
        validation-report.md
        decision.md
      
      # Prompt library (đã có sẵn ở ba-skill/prompt/ — di chuyển vào đây)
      prompt/
        ba/
          template/
            00-kickoff.md
            01-intake-finalize.md
            P1-elicitation-prep/...
            P2-elicitation-exec/...
            P3-domain-scope/...
            P4-brd/...
            P5-srs-prd-stories/...
            P6-wireframes/...
            utility/...
```

---

## 3. Phân chia nội dung: cái gì global, cái gì per-project

### 3.1 Global (skills)

| File loại | Vì sao global | Source từ harness-ba |
| --- | --- | --- |
| `ba-*/skill.md` | Rule + how-to chung cho mọi engagement | Trộn từ docs/WORKFLOW.md, ARCHITECTURE.md, QUALITY_GATES.md theo concern |
| `ba-architecture/checklist/*` | Checklist DoR/DoD chung | docs/QUALITY_GATES.md split theo artifact |
| `ba-*/examples/*` | Mẫu tham khảo, không phải truth của 1 engagement | Viết mới hoặc trích từ docs/demo/ |

### 3.2 Per-project (bootstrap copy)

| File loại | Vì sao per-project | Source từ harness-ba |
| --- | --- | --- |
| `AGENTS.md`, `CLAUDE.md` | Master rules + Claude addendum của engagement | Trộn AGENTS.md cũ + thêm tham chiếu skills |
| `.project-config.yml` | Methodology shape, engagement name, paths | Viết mới (java pattern) |
| `wiki/WORKFLOW.md` | 6 phase — copy giữ nguyên | docs/WORKFLOW.md |
| `wiki/RISK_LANES.md` | Intake gate — copy đổi tên | docs/INTAKE.md |
| `wiki/TRACEABILITY_MATRIX.md` | State engagement | docs/TRACEABILITY_MATRIX.md |
| `wiki/QUALITY_GATES.md` | Tham chiếu local cho convenience | docs/QUALITY_GATES.md (slim version, chi tiết ở skill) |
| `wiki/GLOSSARY.md` | Engagement-level (extends global) | docs/GLOSSARY.md (skeleton) |
| `wiki/HARNESS_BACKLOG.md` | Friction của engagement này | docs/HARNESS_BACKLOG.md |
| `wiki/decisions/` | ADR của engagement | docs/decisions/ (giữ 3 ADR mẫu) |
| `wiki/memory/MEMORY.md` | Feedback rule per-engagement | Viết mới (java pattern) |
| `wiki/elicitation/`, `requirements/`, ... | Workspace artifact engagement | docs/project/* (skeleton + README) |
| `wiki/templates/*` | Template artifact (BA fill in) | docs/templates/* (copy giữ nguyên) |
| `wiki/prompt/ba/template/*` | Prompt library | ba-skill/prompt/* (di chuyển) |
| `.claude/agents/*` | Sub-agents engagement | agents/* (copy + substitute placeholder) |

### 3.3 Drop / merge

| File harness-ba | Xử lý |
| --- | --- |
| docs/HARNESS.md | Merge tinh thần vào `ba-architecture/skill.md` + project AGENTS.md |
| docs/demo/README.md | Move thành `ba-skill/examples/walkthrough.md` (global reference) |
| GETTING_STARTED.md | Rewrite cho structure mới, put ở `ba-skill/` root |
| docs/project/README.md | Merge vào `project-template/README.md` |

---

## 4. Skills list (10 + 1 orchestrator)

| Skill | Phase | Trigger | Output artifact |
| --- | --- | --- | --- |
| `ba-architecture` | All (orchestrator) | Bất kỳ task BA | Dispatch sub-agent |
| `ba-methodology` | P5 entry | Quyết định SRS vs PRD vs US | ADR + folder rename |
| `ba-elicitation-prep` | P1 | Khi cần plan elicitation | stakeholders.md, plan.md, guides/ |
| `ba-elicitation-capture` | P2 | Khi có raw input | notes/<PREFIX>-*.md, sessions/SES-*.md |
| `ba-requirement-analysis` | P2 | Promote raw → REQ | requirements/raw/, analyzed/ |
| `ba-domain-modeling` | P3 | Build glossary + map + module | domain/ |
| `ba-brd` | P4 | Viết BRD | brd/brd.md |
| `ba-spec` | P5 | Viết SRS hoặc PRD | srs/ hoặc prd/ |
| `ba-story` | P5 | Viết epic + US + use case | stories/epics/ |
| `ba-wireframe` | P6 | Vẽ screen spec | wireframes/screens/ |
| `ba-traceability` | All | Maintain matrix | TRACEABILITY_MATRIX.md updates |
| `ba-validation` | All | Crosscheck + signoff + CR | validation/ |

---

## 5. Agents list (12 per-project)

| Agent | Skill chính dùng | Phase |
| --- | --- | --- |
| `ba-intake-classifier` | ba-methodology + ba-architecture | Intake |
| `ba-elicitation-prep-builder` | ba-elicitation-prep | P1 |
| `ba-session-capturer` | ba-elicitation-capture | P2 |
| `ba-requirement-analyst` | ba-requirement-analysis + ba-traceability | P2 |
| `ba-domain-modeler` | ba-domain-modeling + ba-traceability | P3 |
| `ba-brd-writer` | ba-brd + ba-traceability | P4 |
| `ba-spec-writer` | ba-spec + ba-traceability | P5 |
| `ba-story-writer` | ba-story + ba-traceability | P5 |
| `ba-wireframe-architect` | ba-wireframe + ba-validation | P6 |
| `ba-traceability-keeper` | ba-traceability | All (read + update matrix) |
| `ba-validator` | ba-validation | All (crosscheck reports, signoff, CR) |
| `ba-wiki-health-checker` | wiki-health-check | All (verify structure) |

Mỗi agent .md có frontmatter chuẩn Claude Code:
- `name`, `description`, `tools`, `model`
- Trỏ tới skills global qua đường dẫn standard
- Có placeholder `{ENGAGEMENT_NAME}`, `{WIKI_PATH}`, `{METHODOLOGY}` để
  bootstrap substitute.

---

## 6. Installer & Bootstrap design

### 6.1 `install.sh` (global, 1 lần / máy)

```text
bash install.sh                # cài skills + project-template vào ~/.claude/
bash install.sh --dry-run
bash install.sh --uninstall
bash install.sh --with-cursor  # cài cả cursor agent dir
```

Behavior:
1. `~/.claude/skills/ba-architecture/` + `ba-*/` ← copy all skills.
2. `~/.claude/skills/project-template/` ← copy entire project-template/.
3. **KHÔNG** copy agents vào `~/.claude/agents/` (khác java-skill).

### 6.2 `bootstrap.sh` (per-engagement, mỗi engagement chạy 1 lần)

```text
bash ~/.claude/skills/project-template/bootstrap.sh <engagement-path> \
  [--engagement-name=NAME] \
  [--methodology=srs-only|prd-stories|stories-only|undecided]
```

Behavior:
1. Tạo `<engagement-path>/`.
2. Copy `_project-root/*` → `<engagement-path>/` (substitute placeholders).
3. Copy `wiki/*` → `<engagement-path>/wiki/` (substitute placeholders).
4. Copy `~/.claude/skills/ba-architecture/../agents/*` → `<engagement-path>/.claude/agents/` (substitute placeholders).
5. Print next steps: paste `00-kickoff.md` để bắt đầu.

Default methodology=undecided → skip rename folder srs/. Khi user quyết
trong Phase 5, agent đổi srs/ → prd/ nếu cần (hoặc bỏ qua nếu Stories-only).

---

## 7. Phasing thực hiện (6 phase build)

| Phase | Việc | Output | Time guess |
| --- | --- | --- | --- |
| **B1. Skeleton + Plan** | Tạo PLAN.md (file này), README.md, GETTING_STARTED.md, MIGRATION.md skeleton. | 4 file gốc + thư mục rỗng | 1 turn |
| **B2. Orchestrator** | `ba-architecture/skill.md` + checklist/ (master + 22 per-artifact). | ~25 file | 2-3 turn |
| **B3. Concern skills** | 11 concern skill (skill.md + 2-4 example mỗi skill). | ~40 file | 4-5 turn |
| **B4. Agents** | 12 agent .md với frontmatter chuẩn. | 12 file | 2 turn |
| **B5. Project template** | _project-root/*, wiki/* (migrate từ harness-ba). | ~40 file | 3 turn |
| **B6. Installer** | install.sh/bat/ps1 + bootstrap.sh/bat/ps1. | 6 script | 1-2 turn |
| **B7. Migration & Docs** | MIGRATION.md đầy đủ, GETTING_STARTED.md, examples/walkthrough.md. | 3 file | 1 turn |

Tổng: ~125 file, ~7 turn (mỗi turn batch nhiều file).

---

## 8. Migration từ harness-ba

`harness-ba/` còn nguyên, không xóa. Dùng làm reference + sandbox để
test bootstrap.

Mỗi file harness-ba → đích trong ba-skill:

| harness-ba | ba-skill destination |
| --- | --- |
| `AGENTS.md` | merge → `project-template/_project-root/AGENTS.md` (rút gọn) + `ba-architecture/skill.md` (orchestrator rules) |
| `README.md` | rewrite → `project-template/_project-root/README.md` |
| `GETTING_STARTED.md` | rewrite → `ba-skill/GETTING_STARTED.md` |
| `docs/HARNESS.md` | split → `ba-architecture/skill.md` (operating model) + `project-template/wiki/WORKFLOW.md` (loop) |
| `docs/WORKFLOW.md` | copy → `project-template/wiki/WORKFLOW.md` |
| `docs/INTAKE.md` | rename copy → `project-template/wiki/RISK_LANES.md` |
| `docs/ARCHITECTURE.md` | split → `ba-architecture/skill.md` (deps + IDs) + `project-template/wiki/ARCHITECTURE.md` (engagement-facing) |
| `docs/TRACEABILITY_MATRIX.md` | copy → `project-template/wiki/TRACEABILITY_MATRIX.md` |
| `docs/QUALITY_GATES.md` | split → mỗi gate vào `ba-architecture/checklist/checklist-*.md` + slim version ở `project-template/wiki/QUALITY_GATES.md` |
| `docs/GLOSSARY.md` | split → harness terms vào `ba-architecture/skill.md` + project-level skeleton vào `project-template/wiki/GLOSSARY.md` |
| `docs/HARNESS_BACKLOG.md` | template → `project-template/wiki/HARNESS_BACKLOG.md` |
| `docs/decisions/0001..0003` | copy → `project-template/wiki/decisions/` (làm ADR mẫu) |
| `docs/demo/README.md` | move → `ba-skill/examples/walkthrough.md` |
| `docs/templates/*` | copy → `project-template/wiki/templates/*` |
| `docs/project/*/README.md` | copy → `project-template/wiki/<area>/README.md` |
| `ba-skill/prompt/*` (đã ở đây) | move → `project-template/wiki/prompt/ba/template/*` |

---

## 9. Open decisions cần user duyệt

| # | Câu hỏi | Đề xuất | Cần user OK |
| --- | --- | --- | --- |
| Q1 | `agents/` global hay per-project? | Per-project (user đã chốt) | ✅ confirmed |
| Q2 | Tên thư mục wiki vs docs trong engagement? | `wiki/` (align java-skill) | Cần OK |
| Q3 | Methodology shape trong .project-config.yml lưu là enum hay free-text? | enum: `srs-only`, `prd-stories`, `stories-only`, `undecided` | Cần OK |
| Q4 | Skill orchestrator có gọi user qua AskUserQuestion không? | Có (như java-architecture) | Cần OK |
| Q5 | `wiki-health-check` auto-repair có bật mặc định? | Có, nhưng confirm trước mỗi action | Cần OK |
| Q6 | Memory rules persist ở `wiki/memory/MEMORY.md` per-engagement, có sync global? | Per-engagement only (theo java pattern) | Cần OK |
| Q7 | Prompt library di chuyển vào project-template/wiki/prompt/ hay giữ ở ba-skill/ root? | Move vào template — mỗi engagement có bản local có thể tune | Cần OK |
| Q8 | Bootstrap script ngôn ngữ chính? | bash (sh) + ps1 + bat (đa nền tảng như java-skill) | Cần OK |
| Q9 | Có giữ `harness-ba/` làm reference repo lâu dài không? | Có — đánh dấu deprecated, link sang ba-skill | Cần OK |
| Q10 | `ba-skill/prompt/` hiện tại (36 file) có move vào project-template ngay B5 không? | Có | Cần OK |

---

## 10. Acceptance criteria (xong khi nào)

1. Có thể chạy `bash ~/.claude/skills/project-template/bootstrap.sh /path/to/new-engagement`
   và scaffold xong engagement đầy đủ structure.
2. Mở engagement, paste `00-kickoff.md`, agent đọc đúng source-of-truth
   order (`.project-config.yml` → `AGENTS.md` → wiki/ → skills).
3. Agent dispatch đúng sub-agent theo phase (intake → P1 builder → P2
   capturer → ...).
4. Sub-agent đọc đúng skill global qua đường dẫn standard, không hardcode
   path harness-ba.
5. Traceability matrix update tự động sau mỗi sub-agent run.
6. Wiki health check phát hiện được thiếu file/folder + đề xuất repair.
7. Một engagement test (vd: marketing task tool demo) chạy được từ
   bootstrap đến Phase 6 mà không cần edit ngoài quy trình.

---

## 11. Risks & mitigation

| Risk | Mitigation |
| --- | --- |
| Split harness-ba lớn quá → file lộn xộn | Phase hoá B1→B7 từng bước commit-able |
| Agent per-project trùng lặp content giữa engagement | Agent chỉ chứa orchestration; logic ở skill global — engagement chỉ override khi cần |
| Bootstrap không chạy trên Windows PowerShell | Test cả 3 script (sh/bat/ps1) trên thật |
| User nhầm skills global vs per-project khi update | README.md + GETTING_STARTED.md ghi rõ + có `wiki-health-check` cảnh báo |
| Skill quá nhỏ (vi-skill explosion) | Gom logic: 1 skill = 1 phase concern, không < 100 dòng skill.md |
| Migration sót file | MIGRATION.md có checklist 1-1 + script verify |

---

## 12. Sau khi user duyệt PLAN này

1. User confirm Q1-Q10 (hoặc override).
2. Tôi bắt đầu B1: tạo skeleton + 4 doc gốc.
3. Mỗi phase B*: tôi báo cáo lại, user duyệt → sang phase tiếp.
4. Phase B7: kiểm thử bootstrap với 1 engagement giả lập.
5. Final: archive `harness-ba/` thành reference repo, mark deprecated.
