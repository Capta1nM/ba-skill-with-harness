---
name: ba-methodology
description: Phase 5 entry decision. Chọn methodology shape cho engagement (SRS-only, PRD+Stories, Stories-only). Phân tích context engagement → đề xuất + pros/cons → đợi user quyết → log ADR.
allowed-tools: Read, Glob, Grep, AskUserQuestion
---

# ba-methodology — Methodology Shape Decision

Cardinal Rule: **Ask before assuming SRS vs PRD vs US.** Phase 5 entry
KHÔNG được draft spec trước khi methodology shape đã log ADR.

## Khi nào trigger

- User prompt nói "sang P5", "draft SRS", "draft user story", "draft PRD"
  → check `.project-config.yml` mục `methodology`.
- Nếu `methodology = undecided` → trigger skill này TRƯỚC.
- Nếu đã set + user muốn đổi → cần Change Request.

## 3 shape

| Shape | Khi nào dùng | Output Phase 5 |
| --- | --- | --- |
| `srs-only` | Waterfall, fixed-bid, audit/compliance, vendor handover | `docs/srs/srs.md` (IEEE-style), use cases optional |
| `prd-stories` | Product-led, iterative, có PM, internal team | `docs/prd/prd.md` + epics + user stories |
| `stories-only` | Agile thuần, small engagement, in-house team, < 30 stories | epics + user stories only, không có SRS/PRD doc |

## Decision matrix

Hỏi user qua AskUserQuestion với các câu hỏi:

1. **Delivery mode?**
   - Fixed-bid / waterfall / phased delivery → bias `srs-only`.
   - Iterative / continuous delivery → bias `prd-stories` hoặc
     `stories-only`.

2. **Audit/compliance/regulatory?**
   - Có → bias `srs-only`.
   - Không → flexible.

3. **PM role có chuyên trách?**
   - Có → bias `prd-stories`.
   - Không → bias `srs-only` hoặc `stories-only` (phụ thuộc context).

4. **Team size + scope?**
   - Large team, > 50 stories → `srs-only` hoặc `prd-stories`.
   - Small team, < 30 stories → `stories-only` OK.

5. **Vendor handover hay in-house?**
   - Vendor → `srs-only` (cần spec đầy đủ).
   - In-house → flexible.

## Output

1. Đề xuất shape recommended + reason.
2. Pros/cons cho cả 3 shape (KHÔNG chỉ shape recommended).
3. Đợi user quyết qua AskUserQuestion.
4. Sau user quyết → tạo ADR ở `docs/decisions/<NNNN>-methodology.md`:
   - Status: Accepted
   - Context: engagement profile (mode, audit, PM, team, vendor)
   - Decision: chosen shape
   - Alternatives Considered: 2 shape còn lại + lý do reject
   - Consequences: positive + tradeoffs
   - Affected Artifacts: folder rename plan (srs/ → prd/ nếu cần), file
     không tạo (vd: Stories-only thì skip srs/, prd/)
5. Update `.project-config.yml`: `methodology: <chosen>`.
6. Update folder structure trong `docs/`:
   - `srs-only` → keep `docs/srs/`, remove `docs/prd/` (nếu có).
   - `prd-stories` → rename `docs/srs/` → `docs/prd/`.
   - `stories-only` → remove cả `docs/srs/` và `docs/prd/`, chỉ giữ
     `docs/stories/`.

## Re-decide

Nếu user muốn đổi shape sau khi đã quyết:

1. Open Change Request CR.
2. Impact analysis: artifact nào downstream phải re-shape.
3. ADR mới supersedes ADR cũ.

## Anti-patterns

- ❌ Draft SRS/PRD/US trước khi log decision.
- ❌ Default shape = `srs-only` (legacy bias).
- ❌ Đổi shape giữa engagement mà không qua CR.
- ❌ "Hybrid" shape (SRS + PRD cùng lúc) — chọn 1, không trộn.
