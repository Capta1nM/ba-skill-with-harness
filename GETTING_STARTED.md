# Getting Started — ba-skill

Hướng dẫn cho BA mới hoàn toàn, chưa biết gì.

Đọc xong, bạn sẽ biết:

- ba-skill khác `harness-ba` ở chỗ nào.
- Đường đi từ khi nhận yêu cầu khách hàng đến khi có wireframe.
- File nào ở đâu (global vs per-engagement).
- Khi nào dừng lại hỏi agent.

## 1. Mental model 60 giây

```text
~/.claude/skills/                ← kiến thức chung (cài 1 lần)
  ba-architecture/                  orchestrator + checklist
  ba-elicitation-prep/              cách chuẩn bị phỏng vấn
  ba-elicitation-capture/           cách bắt raw + session log
  ba-requirement-analysis/          cách promote raw → REQ
  ba-domain-modeling/               cách build glossary + context map
  ba-brd/                           cách viết BRD
  ba-spec/                          cách viết SRS/PRD
  ba-story/                         cách viết epic + US + use case
  ba-wireframe/                     cách viết wireframe spec
  ba-traceability/                  cách maintain matrix
  ba-validation/                    cách crosscheck + signoff + CR
  ba-methodology/                   cách quyết SRS/PRD/US

<engagement>/                    ← workspace của 1 dự án thật
  AGENTS.md                         master rules cho engagement này
  CLAUDE.md                         Claude addendum
  .project-config.yml               methodology + engagement metadata
  .claude/agents/                   12 sub-agent agent .md
  docs/                             artifact + state engagement
    WORKFLOW.md, RISK_LANES.md, TRACEABILITY_MATRIX.md, ...
    elicitation/, requirements/, domain/, brd/, srs/, stories/,
    wireframes/, validation/
```

→ Skills là **sách giáo khoa**. Agents là **đội thi công**. `docs/` là
**công trường**.

## 2. Khi nào dùng ba-skill

Dùng nếu:
- Bạn nhận yêu cầu khách, đi từ 0 đến BRD/SRS/Wireframe.
- Làm việc với AI, muốn AI tuân thủ quy trình + traceability.
- Cần handover cho BA khác mà không mất context.
- Có nhiều engagement chạy song song.

Không dùng nếu:
- Cập nhật vặt 1 trang doc — overhead lớn hơn lợi ích.
- Engagement quá nhỏ, không cần traceability (~< 10 requirement).

## 3. Setup lần đầu (1 lần / máy)

```bash
cd D:\workspace\my_workspace\ai\skill\ba-skill
bash install.sh
```

Verify:
```bash
ls ~/.claude/skills/ | grep ba-
# nên thấy: ba-architecture, ba-elicitation-prep, ba-*, project-template
```

## 4. Bootstrap engagement mới

Mỗi khi nhận engagement mới:

```bash
bash ~/.claude/skills/project-template/bootstrap.sh \
  D:/workspace/engagements/acme-task-tool \
  --engagement-name="acme-task-tool" \
  --methodology=undecided
```

Sẽ tạo full structure. Cd vào và mở Claude Code:

```bash
cd D:/workspace/engagements/acme-task-tool
# mở Claude Code
```

## 5. Bắt đầu Phase 1 — paste prompt kickoff

```bash
cat docs/prompt/ba/template/00-kickoff.md
```

Copy nội dung, dán đề bài khách hàng vào, gửi cho agent. Agent sẽ:
1. Đọc `AGENTS.md` + `.project-config.yml` + source-of-truth order.
2. Dispatch sub-agent `ba-intake-classifier` (per-engagement, đã có
   trong `.claude/agents/`).
3. Sub-agent đọc skill `ba-architecture` + `ba-methodology` (global) +
   `docs/RISK_LANES.md` (per-engagement).
4. Tạo file intake `docs/elicitation/intake/<date>-<slug>.md`.
5. Hỏi clarifying questions trong file (cột Q&A).

## 6. Đường đi 6 phase

Mỗi phase có prompt riêng trong `docs/prompt/ba/template/`.

```text
00-kickoff.md                 intake gate
01-intake-finalize.md         trả lời clarifying questions

P1-elicitation-prep/          stakeholders, plan, interview guide
P2-elicitation-exec/          dump note, session log, raw → REQ
P3-domain-scope/              glossary, context map, modules, scope
P4-brd/                       draft BRD, crosscheck, signoff
P5-srs-prd-stories/           methodology decision, draft spec + stories
P6-wireframes/                screen specs, crosscheck với SRS
utility/                      DUMP-note, CHECK-state, CR, STOP, HANDOFF
```

Mỗi prompt mỏng, agent đọc đĩa để biết state.

## 7. Bí kíp giao tiếp với agent

Mỗi turn nên có 3 phần:

```text
[1] Đang ở phase nào / vừa xong gì.
[2] Việc cần làm tiếp (cụ thể).
[3] Constraint (file nào touch, ai review).
```

Hoặc đơn giản: paste prompt template tương ứng phase + dán input thật.

## 8. Khi nào dừng hỏi

Agent sẽ dừng và hỏi bạn khi:
- Quyết định methodology (SRS vs PRD vs US-only).
- Đổi scope đã agreed.
- Đè artifact đã signed-off.
- 2 stakeholder mâu thuẫn.
- Phát hiện scope creep từ wireframe.

Bạn nên dừng và check khi:
- Agent đang paraphrase thay vì verbatim ở P2.
- Agent tự promote raw → REQ mà bạn chưa confirm.
- Agent tạo artifact mà bạn không yêu cầu (overreach).
- Matrix không update sau khi đổi artifact.

→ Dùng `docs/prompt/ba/template/utility/STOP-violation.md`.

## 9. Mỗi ngày: thói quen tối thiểu

1. Trước khi mở việc: đọc `docs/TRACEABILITY_MATRIX.md` (1 phút).
2. Mỗi artifact mới/sửa: update matrix cùng lúc.
3. Mỗi quyết định lớn: ADR vào `docs/decisions/`.
4. Mỗi friction harness: ghi `docs/HARNESS_BACKLOG.md`.
5. Mỗi feedback rule muốn agent nhớ: `docs/memory/MEMORY.md`.

## 10. Khác biệt với harness-ba cũ

| Khía cạnh | harness-ba | ba-skill |
| --- | --- | --- |
| Cấu trúc | Tất cả trong 1 folder | Skills global + project template per-engagement |
| Cài đặt | Manual clone folder | install.sh (skills) + bootstrap.sh (engagement) |
| Nhiều engagement | Mỗi engagement = 1 clone | 1 lần cài skill, n lần bootstrap |
| Update skill | Sửa trong từng clone | Sửa 1 nơi, re-install |
| Per-engagement state | docs/project/ | docs/ |
| Agents | Không có (chỉ prompt) | 12 sub-agent dispatch qua orchestrator |
| Sub-agent specialization | Không | Có (intake-classifier, brd-writer, ...) |

Migration chi tiết: `MIGRATION.md`.

## 11. Khi cần hiểu sâu hơn

Theo thứ tự:

1. `examples/walkthrough.md` — end-to-end 1 engagement giả lập.
2. `ba-architecture/skill.md` — operating model của orchestrator.
3. `ba-architecture/checklist/ba-checklist.md` — master checklist.
4. `project-template/_project-root/AGENTS.md` — master rules engagement.
5. `<bất kỳ skill>/skill.md` — hiểu 1 skill cụ thể.

## 12. Checklist 10 phút đầu tiên

- [ ] Đọc `README.md` (3 phút).
- [ ] Đọc file này (4 phút).
- [ ] Xem qua `examples/walkthrough.md` (3 phút).
- [ ] Sẵn sàng nhận engagement đầu tiên.
