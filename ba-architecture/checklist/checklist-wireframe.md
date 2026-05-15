# Checklist — Wireframe Screen Spec

## Metadata required

- ID prefix: `SCR-`
- File path: `docs/wireframes/screens/SCR-<name>.md`
- Status: `draft | review | agreed | changed | retired`
- Module: MOD-XXX
- Primary actor: filled
- Visual artifact: link Figma/Balsamiq/image/markdown sketch

## DoR (vào `review`)

- [ ] ID + name + module + primary actor filled.
- [ ] Purpose 1 câu.
- [ ] Served stories table: US/UC ID + acceptance condition reached on
      this screen.
- [ ] Trace to spec: SR-X.X.X / CAP-XXX, REQ, glossary terms.
- [ ] Fields & Components table: ID, label, type, required, validation,
      default, source data.
- [ ] Actions table: action, trigger, behavior, destination,
      permissions, audit.
- [ ] States: default, loading, empty, error, read-only, disabled (mỗi
      state có when + visual + behavior).
- [ ] Error & edge cases với SRS reference cho mỗi case.
- [ ] Accessibility: keyboard flow, screen-reader, color/contrast, WCAG
      level.
- [ ] Localization: languages, RTL, date/number/currency format.
- [ ] Visual artifact attached.

## DoD (vào `agreed`)

- [ ] Cross-check report exists in `docs/validation/`:
  - [ ] Mọi AC của served stories reachable trên screen.
  - [ ] Mọi field có SR/REQ backing (không scope creep).
  - [ ] Mọi error/empty state có SR backing hoặc đã add REQ mới
        (Change Request).
- [ ] UX/product review approved.
- [ ] Walkthrough với owning stakeholder evidence.

## Trace links bắt buộc

- Upstream: stories/UC, SR/CAP, REQ, module.
- Downstream: nothing (screen là leaf của BA pipeline).

## Anti-patterns

- ❌ Field mới trên screen mà SRS không nhắc → scope creep ngầm.
- ❌ Skip error/empty state.
- ❌ Skip accessibility section.
- ❌ "Refer to Figma" thay vì spec text cụ thể (Figma có thể đổi).
- ❌ Status agreed khi cross-check chưa pass.
