---
name: ba-wireframe
description: Phase 6 skill. Write screen specs. Mỗi screen serve ≥1 story, mỗi story có ≥1 screen (nếu UI). Cross-check liên tục với SRS/PRD. Phát hiện scope creep từ wireframe.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-wireframe — Phase 6 Skill

## Mục đích

Visualize mọi screen và reconcile với SRS/PRD/Stories. Phát hiện scope
creep ngầm.

## Cardinal Rule

- **No wireframe ahead of its SRS.** Draft OK ở status `draft`. Status
  `agreed` yêu cầu cross-check pass.
- **Mọi field/action trên screen phải có SR/REQ backing.** Field "lạ" =
  scope creep.

## Workflow

```text
1. Read stories + SRS/PRD + modules
        |
        v
2. Propose screen list
        SCR-ID | Name | Module | Primary actor | Served stories | Purpose
        Mọi UI story phải có ≥1 screen.
        Mọi screen phải serve ≥1 story.
        Trình user.
        |
        v (user confirm)
3. For each screen, write SCR-<name>.md theo template
        - Fields/components
        - Actions
        - States (default, loading, empty, error, read-only, disabled)
        - Error & edge cases
        - Accessibility (WCAG, keyboard, screen reader)
        - Localization
        - Cross-references SR/REQ + glossary
        - Visual artifact link (Figma/Balsamiq/image)
        Pass checklist-wireframe DoR.
        |
        v
4. Cross-check (continuous)
        Mọi story AC reachable trên screen?
        Mọi field có SR/REQ backing?
        Mọi error/empty state có SR backing?
        Output docs/validation/<date>-crosscheck-wireframes.md
        |
        v (resolve findings)
5. UX/product review
        |
        v
6. Walkthrough với owning stakeholder
        Capture docs/validation/<date>-walkthrough-screens.md
        |
        v
7. Status → agreed (chỉ khi cross-check pass)
        |
        v
8. Update TRACEABILITY_MATRIX (cột Wireframe)
```

## Scope creep detection

Khi cross-check tìm thấy field/action trên screen mà SRS không nhắc:

3 cách xử lý:

1. **Add REQ mới** → open Change Request, loop về Phase 5 viết REQ + SR
   mới. Wireframe field giữ.
2. **Remove field** → wireframe sai, xóa khỏi spec.
3. **Map vào REQ hiện có** → nếu thực ra field đó được cover bởi REQ
   đã có nhưng wireframe quên link. Update trace.

KHÔNG silent keep field. Mỗi field "lạ" tạo defect.

## State coverage

Mỗi screen phải document 6 state:

| State | When | Visual | Behavior |
| --- | --- | --- | --- |
| Default | Normal use | ... | ... |
| Loading | Async fetch | spinner | disable interaction |
| Empty | No data | empty illustration + CTA | ... |
| Error | API fail | error banner | retry button |
| Read-only | Permissions limited | grayed | no inputs |
| Disabled | Workflow gates | grayed | tooltip explain why |

Skip state → scope creep risk.

## Accessibility section

Mỗi screen bắt buộc:

- Keyboard flow (tab order, focus indicators).
- Screen-reader landmarks (heading levels, ARIA roles).
- Color/contrast notes (don't rely on color alone).
- WCAG level target (AA mặc định).

Skip = checklist fail.

## Anti-patterns

- ❌ Field mới silent (scope creep ngầm).
- ❌ Skip error/empty state.
- ❌ Skip accessibility.
- ❌ "Refer to Figma" thay vì spec text (Figma có thể đổi).
- ❌ Status agreed khi cross-check chưa pass.
- ❌ Screen serve 0 story (orphan).
- ❌ Story UI không có screen.
