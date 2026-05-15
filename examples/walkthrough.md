# Walkthrough — End-to-end Engagement Demo

Engagement giả lập "Marketing Task Tool" qua 6 phase với ba-skill.

## Setup (1 lần / máy)

```bash
cd D:/workspace/my_workspace/ai/skill/ba-skill
bash install.sh
```

Verify:
```bash
ls ~/.claude/skills/ | grep ba-
# ba-architecture, ba-brd, ba-domain-modeling, ba-elicitation-capture,
# ba-elicitation-prep, ba-methodology, ba-requirement-analysis,
# ba-spec, ba-story, ba-traceability, ba-validation, ba-wireframe,
# project-template
```

## Bootstrap engagement

```bash
bash ~/.claude/skills/project-template/bootstrap.sh \
  D:/workspace/engagements/marketing-task-tool \
  --engagement-name=marketing-task-tool \
  --methodology=undecided
```

Output:
```
Engagement structure:
   .../AGENTS.md
   .../CLAUDE.md
   .../.project-config.yml
   .../.claude/agents/ (12 agents)
   .../docs/ (~80 markdown files)
```

## Phase 0 — Intake

Mở Claude Code ở engagement folder. Paste
`docs/prompt/ba/template/00-kickoff.md` với đề bài:

```text
Marketing team needs an internal tool to track campaign tasks.
Right now they use a shared spreadsheet. People miss deadlines and
nobody knows who owns what. Launch in 3 months.
```

→ Orchestrator dispatch `ba-intake-classifier` → tạo
`docs/elicitation/intake/2026-05-11-marketing-task-tool.md`:

```text
Input type: new engagement
Phase: P1 Elicitation Prep
Lane: normal
Risk flags: scope, non-functional
Clarifying Q&A count: 4
Next: trả lời Q1-Q4, paste 01-intake-finalize.md
```

Trả lời Q&A → `01-intake-finalize.md` → status `accepted`.

## Phase 1 — Elicitation Prep

Paste `P1/10-propose.md` → orchestrator dispatch
`ba-elicitation-prep-builder`:

```text
Stakeholders proposed:
  STK-001 Marketing Lead (sponsor)
  STK-002 Marketing Coordinator x3 (primary users)
  STK-003 IT Operations (deploy)
  STK-101 Legal (privacy review)
  STK-102 InfoSec (access control)

Plan proposed:
  W1: 1:1 sponsor + 3 coordinator
  W2: workshop + IT
  W3: Legal + InfoSec

Total 8 sessions / 3 weeks. Capacity OK.
```

User confirm → paste `11-write-stakeholders.md` + `12-write-plan.md` →
agent ghi files. Pass DoR.

Soạn 2 interview guides (sponsor + coordinator). Pass DoR.

`15-exit-gate.md` → all pass. Sang P2.

## Phase 2 — Elicitation Execution

Sau buổi với STK-001:

1. Save Zoom transcript vào `docs/elicitation/notes/attachments/2026-05-14-mkt-lead-transcript.txt`.
2. Paste `utility/DUMP-note.md` Cách A → agent tạo
   `MN-2026-05-14-mkt-lead.md` với verbatim + tags.
3. Paste `P2/21-capture-session.md` với note IDs → agent tạo
   `SES-2026-05-14-mkt-lead.md` + extract `RAW-001..RAW-008`.
4. Update matrix tự động.

Lặp 4 lần cho 4 stakeholder. Total ~25 RAW.

Paste `P2/22-promote-raw-to-req.md`:

```text
Proposals (CHƯA ghi file):
  REQ-001 (must, MOD-TaskCapture) — Capture task. Sources: RAW-001,008,015,023
  REQ-002 (must, MOD-Visibility) — Overdue flag. Sources: RAW-002
  NFR-001 (must) — Response p95 < 2s. Sources: RAW-024
  ...

Conflicts:
  RAW-018 says "weekly report" but RAW-024 says "monthly". Reconcile.
```

User chốt → agent ghi files + matrix.

## Phase 3 — Domain Mapping

`P3/30-glossary.md` → glossary với collision detection. "Owner" có 3
nghĩa → reconciliation session → split thành "Campaign Owner" + "Task
Owner". ADR-0004 log.

`P3/31-context-map.md` → ASCII map với 3 module dự kiến.

`P3/32-modules.md` → MOD-TaskCapture, MOD-Visibility, MOD-Notification.

`P3/33-scope.md` → in/out scope. Email/Slack import → out-of-scope
(defer v2). Sponsor walkthrough → evidence ghi vào
`docs/validation/2026-05-22-walkthrough-scope.md`.

`P3/34-exit-gate.md` → all pass.

## Phase 4 — BRD

`P4/40-draft-brd.md` → outline → user confirm → full BRD với 12 section.

`P4/41-crosscheck-brd.md` → 0 block, 1 major (REQ-008 chưa cover trong
section 6), 2 minor. Fix major → re-check pass.

Circulate review 1 tuần. Sponsor sign-off ngày 2026-05-30.

`P4/42-signoff.md` → tạo `docs/validation/2026-05-30-signoff-brd.md`.
Status BRD → signed-off. Matrix updated.

## Phase 5 — Methodology + Spec

`P5/50-methodology-decision.md`:

```text
Context: internal tool, 3-month iterative, no audit, BA part-time.
Recommended: stories-only.
Alternatives:
  - srs-only: overweight (rejected)
  - prd-stories: no PM dedicated (rejected)
User confirm → ADR-0005 logged → methodology=stories-only.
docs/srs/ và docs/prd/ removed (not used).
```

Skip `P5/51-draft-spec.md`. Đi thẳng `P5/52-draft-epics-stories.md`:

```text
Epics proposed:
  EPC-01 Task Capture (BR-6.1, BR-6.4)
  EPC-02 Visibility & Overdue (BR-6.2)
  EPC-03 Reassignment (BR-6.3)
  EPC-04 Reporting (BR-6.5, priority=could)
```

Write epics + ~15 stories. Mỗi US có AC Given/When/Then + INVEST pass.

`P5/53-crosscheck.md` → tech lead review → 1 blocker (US-008 storage
not ready) → US-008 defer v2. Other stories agreed.

## Phase 6 — Wireframes

`P6/60-list-screens.md` → ~8 screen.

`P6/61-draft-screen-spec.md` cho từng screen. Trace stories + SR.

`P6/62-crosscheck-wireframes-vs-spec.md` → findings:
- F-1 (major): SCR-Backlog có column "Priority" mà story không define.
- F-3 (minor): SCR-Backlog có "Tags" mà chưa REQ.

Sponsor confirm Priority đáng giữ → open CR-2026-06-12-001 → add REQ-012
+ SR + US-014. Tags → remove khỏi wireframe (out-of-scope confirmed).

`P6/63-exit-gate.md` → all pass.

## Done

Engagement status: active → delivery-handover.

```bash
# Archive plan: sau khi delivery xong
mv D:/workspace/engagements/marketing-task-tool \
   D:/workspace/engagements/_archive/marketing-task-tool-2026Q2
```

## Total artifact count (ước lượng demo)

- ~25 raw notes
- ~25 RAW statements
- ~18 analyzed REQ + 5 NFR + 3 CON + 2 ASM
- 3 modules
- 1 BRD signed-off
- 4 epics + 15 stories
- 8 wireframe screens
- ~15 validation reports
- 5 ADRs
- 12 sub-agents (per-engagement)
- 1 traceability matrix (continuously synced)

Total ~150 file artifact engagement-side, ~160 file harness-side
(ba-skill global + project template).

## Key lessons demonstrated

- Skills global = update 1 lần, mọi engagement benefit.
- Agents per-engagement = methodology + glossary + scope context isolated.
- Traceability matrix = control panel; contradiction detection auto.
- Cross-check P6 = bắt scope creep TRƯỚC delivery (Tags, Priority).
- ADR = decisions persist, không sống trong chat.
- Memory = feedback rule learn được cross-task.
