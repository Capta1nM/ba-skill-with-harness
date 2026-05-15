---
name: ba-story
description: Phase 5 skill. Write epic + user story + use case. AC dạng Given/When/Then testable. INVEST check. Trace lên BR + SR/CAP + module. Story độc lập valuable.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-story — Phase 5 Story Skill

## Tiền đề

Methodology decision đã log:

- `prd-stories` → write epics + user stories + (optional) use cases.
- `stories-only` → write epics + user stories, NO SRS/PRD.
- `srs-only` → write use cases (story optional).

## Workflow

```text
1. Read BRD + SRS/PRD (nếu có) + modules + glossary
        |
        v
2. Propose epic decomposition
        Bảng epic dự kiến: EPC-ID | Name | Outcome | Source BR/SR/CAP |
        Module | Stories planned.
        Trình user.
        |
        v (user confirm)
3. For each epic, write epic.md theo template
        Pass checklist-epic.
        |
        v
4. For each story trong epic, write US-XXX.md
        - As/I want/So that
        - AC Given/When/Then
        - INVEST check
        - Trace links
        Pass checklist-user-story.
        |
        v
5. (Optional, SRS-only) Use case UC-XXX.md
        - Actor, trigger, preconditions, postconditions
        - Basic + alternative + exception flows
        Pass checklist-use-case.
        |
        v
6. Cross-check
        Mọi must BR/SR/CAP có ≥1 story/use case cover?
        Mọi story có trace links đầy đủ?
        AC có testable thực sự (không restate)?
        |
        v
7. Tech lead review (buildability) + Product owner review (intent)
        |
        v
8. Update TRACEABILITY_MATRIX (cột Story)
```

## Epic structure

- ID `EPC-XX`.
- Business Outcome (trace OUT-XX hoặc OBJ-XX).
- Source: BR + SR/CAP + REQs.
- Description.
- Stories Included (table US-IDs).
- Out-of-scope for epic.
- Open questions.

## User story format

```text
As a <role>
I want <capability>
So that <outcome>
```

⚠️ "As a system / I want..." = sai. System không phải role.

## Acceptance Criteria

Given/When/Then:

```text
AC-1 Scenario: <name>
  Given <precondition>
  When <action>
  Then <expected outcome>
```

Testable rule: AC viết được test case automation từ AC. Nếu không →
chưa testable.

## INVEST check

Mỗi story:

- **I**ndependent (hoặc dependency declared).
- **N**egotiable.
- **V**aluable to user/business outcome.
- **E**stimable.
- **S**mall (≤2 sprint).
- **T**estable.

Story fail 1 chiều → split hoặc reshape.

## Anti-patterns

- ❌ AC restate requirement không thêm precision.
- ❌ Story too big (>2 sprint) — split.
- ❌ "As a system / I want..."
- ❌ Skip INVEST check.
- ❌ Story không có outcome cho user/business.
- ❌ Missing trace links (orphan story).
- ❌ AC vague: "hệ thống hoạt động đúng".
