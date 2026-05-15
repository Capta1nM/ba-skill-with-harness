# Memory

Engagement-local feedback rules. Agent đọc đầu mỗi task để apply
learned rules consistently.

## Files

- `MEMORY.md` — append-only entries.
- `_entry-template.md` — schema + examples.

## Workflow

```text
1. Friction observed hoặc user "ghi nhớ" command.
        |
        v
2. Agent propose memory entry draft cho user confirm.
        |
        v
3. After confirm → append to MEMORY.md.
        |
        v
4. Agent đầu mỗi task: read MEMORY.md → apply active entries.
```

## Scope

- Engagement-only. KHÔNG sync OS-level Claude memory (per Q6 decision).
- Reset khi engagement archive.

## Retirement

Entry KHÔNG edit hồi tố. Sai → mark `status: retired` + new entry. Lý
do retire ghi trong History.
