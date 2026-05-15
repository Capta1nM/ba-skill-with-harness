# Stories

Suggested layout:

```text
stories/
  backlog.md                     # ordered list of all stories
  epics/
    EPC-<id>-<name>/
      epic.md                    # filled from templates/epic.md
      US-<id>-<name>.md          # filled from templates/user-story.md
      UC-<id>-<name>.md          # filled from templates/use-case.md (if used)
```

Every story file must trace to at least one SRS clause or PRD outcome and
sit inside one module.
