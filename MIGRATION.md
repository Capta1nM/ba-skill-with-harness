# Migration — harness-ba → ba-skill

Hướng dẫn chuyển từ repo `harness-ba/` (monolithic) sang `ba-skill/`
(skill global + per-engagement template).

## Tại sao migration

`harness-ba/` thiết kế cho 1 engagement đơn lẻ. Khi có nhiều engagement
chạy song song hoặc muốn share kiến thức cross-engagement, cần tách:

- **Kiến thức chung** (cách viết BRD, US, SRS, ...) → skill global, cài
  1 lần, mọi engagement hưởng lợi khi skill update.
- **State engagement** (artifact + decision + matrix) → per-engagement,
  isolation hoàn toàn.
- **Sub-agents specialized** → per-engagement, tuned cho methodology +
  glossary + scope của engagement đó.

## Tóm tắt mapping

| harness-ba file | ba-skill destination | Xử lý |
| --- | --- | --- |
| `AGENTS.md` | Split | Operating rules → `ba-architecture/skill.md` (global). Project rules → `project-template/_project-root/AGENTS.md` (per-engagement). |
| `README.md` | Rewrite | → `project-template/_project-root/README.md` (engagement README). |
| `GETTING_STARTED.md` | Rewrite | → `ba-skill/GETTING_STARTED.md` (cho structure mới). |
| `docs/HARNESS.md` | Split | Operating model → `ba-architecture/skill.md`. Loop diagram → `project-template/docs/WORKFLOW.md`. |
| `docs/WORKFLOW.md` | Copy | → `project-template/docs/WORKFLOW.md`. |
| `docs/INTAKE.md` | Rename copy | → `project-template/docs/RISK_LANES.md` (align java naming). |
| `docs/ARCHITECTURE.md` | Split | Dependency rule + ID scheme → `ba-architecture/skill.md`. Engagement-facing → `project-template/docs/ARCHITECTURE.md`. |
| `docs/TRACEABILITY_MATRIX.md` | Copy | → `project-template/docs/TRACEABILITY_MATRIX.md`. |
| `docs/QUALITY_GATES.md` | Split | Per-artifact gate → `ba-architecture/checklist/checklist-*.md`. Slim version → `project-template/docs/QUALITY_GATES.md`. |
| `docs/GLOSSARY.md` | Split | Harness terms → `ba-architecture/skill.md`. Project-level skeleton → `project-template/docs/GLOSSARY.md`. |
| `docs/HARNESS_BACKLOG.md` | Template | → `project-template/docs/HARNESS_BACKLOG.md`. |
| `docs/decisions/0001..0003.md` | Copy as samples | → `project-template/docs/decisions/`. Đánh dấu là "sample ADR". |
| `docs/demo/README.md` | Move | → `ba-skill/examples/walkthrough.md`. |
| `docs/templates/*.md` | Copy | → `project-template/docs/templates/`. |
| `docs/project/*/README.md` | Copy | → `project-template/docs/<area>/README.md`. |
| `ba-skill/prompt/*` (đã có) | Move | → `project-template/docs/prompt/ba/template/`. |

## Mapping artifact ID không đổi

Toàn bộ ID scheme giữ nguyên: `STK-`, `SES-`, `RAW-`, `REQ-`, `NFR-`,
`CON-`, `ASM-`, `MOD-`, `BR-`, `SR-`, `EPC-`, `US-`, `UC-`, `SCR-`,
`DEC-`, `CR-`, `MN-`, `TR-`, `EM-`, `DOC-`, `MSG-`, `OBS-`, `SUR-`,
`INT-`.

Existing engagement (nếu đã chạy harness-ba/) chỉ cần:
1. Rename `docs/project/` → `docs/` (xóa wrapper `project/`).
2. Add `AGENTS.md` mới + `.project-config.yml` từ
   `~/.claude/skills/project-template/_project-root/`.
3. Copy agents từ `~/.claude/skills/project-template/_project-root/.claude/agents/`
   vào engagement.
4. Cài skills global (`bash install.sh` 1 lần).

## Đường đi migration đề xuất

### Cách 1 — Engagement mới (recommended)

Nếu chưa có engagement đang chạy:
1. Cài ba-skill: `bash install.sh`.
2. Bootstrap engagement đầu: `bootstrap.sh /path/to/new`.
3. Bắt đầu từ Phase 1.

### Cách 2 — Migrate engagement đang chạy

Nếu đang có engagement chạy với harness-ba/:

1. **Backup**: `cp -r harness-ba/ harness-ba-backup/`.
2. **Cài ba-skill global**: `bash ba-skill/install.sh`.
3. **Bootstrap engagement mới empty**:
   `bootstrap.sh /tmp/empty-engagement`.
4. **Copy state** từ harness-ba sang engagement mới:
   ```bash
   # state files (intake, requirements, ...)
   cp -r harness-ba/docs/project/* my-engagement/docs/
   
   # decisions + harness backlog
   cp harness-ba/docs/decisions/*.md my-engagement/docs/decisions/
   cp harness-ba/docs/HARNESS_BACKLOG.md my-engagement/docs/
   
   # traceability matrix
   cp harness-ba/docs/TRACEABILITY_MATRIX.md my-engagement/docs/
   
   # glossary (project-specific)
   cp harness-ba/docs/project/domain/glossary.md my-engagement/docs/domain/
   ```
5. **Verify**: chạy prompt `utility/CHECK-state.md` để agent verify
   structure.
6. **Update reference** trong artifact (nếu có dẫn `docs/project/...`):
   tìm thay bằng `docs/...`.
7. **Run health check**: dispatch `ba-wiki-health-checker` agent.

## Deprecation policy

`harness-ba/` sẽ:
- Giữ live cho đến hết Q3 2026.
- README ghi rõ "deprecated, see ba-skill/".
- Không nhận update mới — bug fix critical thì port sang ba-skill.
- Sau Q3 2026: archive read-only.

## Verify migration thành công

Checklist:

- [ ] `bash install.sh` chạy không lỗi.
- [ ] `ls ~/.claude/skills/ | grep ba-` thấy đủ 12 skill + project-template.
- [ ] `bash project-template/bootstrap.sh /tmp/test-engagement` tạo
      engagement mới đầy đủ structure.
- [ ] Engagement mới có `AGENTS.md` + `.project-config.yml` đầy đủ
      placeholder substituted ({ENGAGEMENT_NAME} → real name).
- [ ] `.claude/agents/` chứa 12 agent .md.
- [ ] `docs/` skeleton có WORKFLOW.md, RISK_LANES.md,
      TRACEABILITY_MATRIX.md, ARCHITECTURE.md, QUALITY_GATES.md,
      GLOSSARY.md, HARNESS_BACKLOG.md.
- [ ] `docs/prompt/ba/template/` chứa 37 prompt (00-kickoff +
      01-intake-finalize + P1-P6 + utility).
- [ ] `docs/templates/` chứa 20 artifact template.
- [ ] `docs/decisions/` chứa 3 ADR mẫu + README + _template.
- [ ] `docs/memory/` chứa MEMORY.md + _entry-template.md + README.
- [ ] Paste `00-kickoff.md`, agent đọc đúng source-of-truth order.

## Sanity test (1 engagement giả lập)

```bash
# 1. Install
cd D:/workspace/my_workspace/ai/skill/ba-skill
bash install.sh

# 2. Bootstrap test
bash ~/.claude/skills/project-template/bootstrap.sh \
  /tmp/test-engagement \
  --engagement-name=test \
  --methodology=undecided

# 3. Verify structure
ls /tmp/test-engagement/
# Expected: AGENTS.md, CLAUDE.md, README.md, .project-config.yml, .claude/, docs/

cat /tmp/test-engagement/.project-config.yml | grep engagementName
# Expected: engagementName: "test"

ls /tmp/test-engagement/.claude/agents/ | wc -l
# Expected: 13 (12 agents + README)

find /tmp/test-engagement/docs -name "*.md" | wc -l
# Expected: ~70+ markdown files

# 4. Cleanup test
rm -rf /tmp/test-engagement
```

Nếu mọi check pass → migration thành công, có thể engagement mới dùng
ba-skill.

## Khi gặp lỗi migration

1. Mở `docs/HARNESS_BACKLOG.md` của engagement và ghi friction.
2. Mở issue ở repo ba-skill (nếu có).
3. Rollback: dùng backup harness-ba/ cho đến khi fix.
