# Docs Health Check

Verify cấu trúc `docs/` của engagement intact + đề xuất repair nếu thiếu.
Dùng bởi sub-agent `ba-wiki-health-checker`.

## Expected structure

```text
<engagement>/
  AGENTS.md                       (required)
  CLAUDE.md                       (optional)
  README.md                       (optional)
  .project-config.yml             (required — engagement marker)
  .claude/agents/                 (required, ≥1 file)
  docs/
    WORKFLOW.md                   (required)
    RISK_LANES.md                 (required)
    ARCHITECTURE.md               (required)
    TRACEABILITY_MATRIX.md        (required)
    QUALITY_GATES.md              (required, slim version)
    GLOSSARY.md                   (required)
    HARNESS_BACKLOG.md            (required)
    decisions/                    (required, ≥README.md)
    memory/                       (required, MEMORY.md + _entry-template.md)
    elicitation/
      intake/                     (required, may be empty)
      notes/                      (required, may be empty)
        attachments/              (required, may be empty)
      sessions/                   (required, may be empty)
      guides/                     (required, may be empty)
      README.md                   (required)
    requirements/
      raw/                        (required, may be empty)
      analyzed/                   (required, may be empty)
      README.md                   (required)
    domain/
      modules/                    (required, may be empty)
      README.md                   (required)
    brd/
      README.md                   (required)
    srs/                          (or prd/ depending on methodology)
      README.md                   (required)
    stories/
      epics/                      (required, may be empty)
      README.md                   (required)
    wireframes/
      screens/                    (required, may be empty)
      assets/                     (required, may be empty)
      README.md                   (required)
    validation/
      changesets/                 (required, may be empty)
      README.md                   (required)
    templates/                    (required, ≥10 file template)
    prompt/ba/template/           (required, ≥10 prompt)
```

## Check ID

| Check ID | Mô tả | Severity nếu fail |
| --- | --- | --- |
| H-001 | `.project-config.yml` tồn tại ở engagement root | block |
| H-002 | `AGENTS.md` tồn tại + có frontmatter | block |
| H-003 | `.claude/agents/` có ≥1 .md | block |
| H-004 | `docs/` tồn tại | block |
| H-005 | Mọi file required ở section "Expected structure" trên có mặt | major |
| H-006 | Mọi folder required tồn tại (kể cả empty) | major |
| H-007 | `docs/srs/` hoặc `docs/prd/` đúng theo methodology decision (kiểm `.project-config.yml`) | major |
| H-008 | `docs/TRACEABILITY_MATRIX.md` không có row "treo" (downstream agreed mà upstream draft) | block |
| H-009 | Mọi REQ trong `requirements/analyzed/` có row trong matrix | major |
| H-010 | Mọi BR-X.X trong BRD trace đến ≥1 REQ | major |
| H-011 | Mọi SR/CAP trace đến ≥1 BR | major |
| H-012 | Mọi US trace đến ≥1 SR/CAP | major |
| H-013 | Mọi SCR trace đến ≥1 US | major |
| H-014 | Mọi RAW có ≥1 source note (MN/TR/EM/...) | major |
| H-015 | Mọi note đã `processed` có downstream reference filled | minor |
| H-016 | Mọi decision file có frontmatter status + date | minor |
| H-017 | `docs/memory/MEMORY.md` tồn tại (có thể empty) | minor |
| H-018 | `docs/HARNESS_BACKLOG.md` tồn tại | minor |
| H-019 | Mọi sub-folder `docs/<area>/` có `README.md` | minor |
| H-020 | Prompt library `docs/prompt/ba/template/` có ≥10 prompt | minor |

## Severity → action

| Severity | Action |
| --- | --- |
| block | Engagement chưa hợp lệ. Pause mọi task. Đề xuất bootstrap lại hoặc fix tay. |
| major | Có thể continue nhưng nên fix sớm. Báo cáo user + đề xuất auto-repair. |
| minor | Note để fix sau. Add vào HARNESS_BACKLOG.md. |

## Auto-repair behavior

Khi `--repair` enabled:

1. Missing file required → copy từ
   `~/.claude/skills/project-template/<path-tương-ứng>` + substitute
   placeholder.
2. Missing folder required → tạo + add README.md từ template.
3. Matrix row treo → flag trong report, KHÔNG tự sửa (cần user quyết).
4. Trace link thiếu → flag, KHÔNG tự bịa.

Mọi auto-repair phải:
- Confirm với user trước mỗi action (qua AskUserQuestion).
- Log vào `docs/validation/<date>-health-check-repair.md`.
- Update HARNESS_BACKLOG nếu pattern lặp lại (cải thiện bootstrap).

## Output format

```text
[Health Check] <date>

block: 0 / major: 2 / minor: 3 / pass: 15

BLOCK:
  (none)

MAJOR:
  H-007: docs/srs/ tồn tại nhưng methodology=stories-only
         → rename docs/srs/ → docs/srs-deprecated/ hoặc remove
  H-009: REQ-042 chưa có row matrix
         → add row

MINOR:
  H-015: MN-2026-05-12-cfo.md processed nhưng downstream refs empty
         → update note metadata
  ...

Recommended actions:
  1. Run auto-repair cho 2 major issue (confirm trước mỗi action)?
  2. Add 3 minor issue vào HARNESS_BACKLOG.md
```
