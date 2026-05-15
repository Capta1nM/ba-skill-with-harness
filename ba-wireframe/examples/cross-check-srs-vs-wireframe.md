# Example — Cross-Check Wireframe vs SRS

## Context

Phase 6 draft xong SCR-Backlog. Cross-check vs SRS sections 4.x.

## Findings

```markdown
# docs/validation/2026-06-12-crosscheck-wireframes.md

Date: 2026-06-12
Type: crosscheck
Scope: All wireframes in docs/wireframes/screens/ vs SRS sec 4.x
Method: Manual walkthrough using checklist-wireframe.md
Owner: BA1

## Artifacts in scope

| Artifact | ID | Version | Entering | Leaving |
| --- | --- | --- | --- | --- |
| SCR-Backlog | SCR-Backlog | v0.3 | draft | review |
| SCR-TaskCreate | SCR-TaskCreate | v0.2 | draft | review |
| SCR-TaskDetail | SCR-TaskDetail | v0.1 | draft | (still draft) |

## Findings

| F-ID | Severity | Artifact | Finding | Resolution | Owner |
| --- | --- | --- | --- | --- | --- |
| F-1 | major | SCR-Backlog | Has column "Priority" but no SR clause defines task priority field | Open CR-2026-06-12-001 to add REQ-012 (task priority field) → SR-4.1.5 → US-014. Wireframe field stays. | BA1 |
| F-2 | minor | SCR-TaskDetail | Missing "empty comments" state | Add empty state spec in SCR-TaskDetail. | BA1 |
| F-3 | minor | SCR-Backlog | "Tags" column shown but no SR clause | Remove from wireframe v0.4 (sponsor confirmed tags out-of-scope v1) | BA1 |
| F-4 | info | All | No screen serves US-018 (export report) | US-018 priority=could; defer screen design to v2. | PO |

## Traceability impact

Rows updated trong matrix:

- SCR-Backlog → status changed from draft to review (after F-3 fix).
- SCR-TaskCreate → review.
- SCR-TaskDetail → stay draft (F-2 unresolved).
- REQ-012 (new, pending CR approval) → row added with status proposed.

## Follow-up

- BA1: open CR-2026-06-12-001 for F-1.
- BA1: remove Tags column trong SCR-Backlog v0.4 for F-3.
- BA1: spec empty comments state SCR-TaskDetail for F-2.
- PO: confirm US-018 deferred or v2 timeline.
```

## Vì sao tốt

- Tìm ra 3 scope creep (F-1, F-3) trước khi delivery.
- F-1 đáng giữ → CR (loop về P5).
- F-3 không đáng giữ → remove khỏi wireframe.
- F-2 minor → fix in-place.
- F-4 info → flag, không block.
- Traceability impact ghi rõ.

## Anti-example

❌ Wireframe ship với Tags column.

Hệ quả:
- Dev build feature Tags, không có REQ/SR backing.
- BA bị hỏi: "Tags là gì? Ai yêu cầu?"
- Sponsor: "Tao không yêu cầu Tags."
- Phải remove ở Sprint 3 → waste 1 tuần dev + 1 tuần QA.

→ Cross-check ở P6 BẢO HIỂM cho scope creep.

## Quy tắc cross-check

Sau mỗi batch screen (~3-5 screens), chạy cross-check. Trước khi đổi
status `agreed`, BẮT BUỘC cross-check pass (no block, all major resolved).
