# MEMORY — {ENGAGEMENT_NAME}

Feedback rules đã học trong engagement này.

Mỗi entry là 1 rule applicable cross-task. Agent đọc file này đầu mỗi
task (per `.project-config.yml` `memoryRules.reviewMemoryOnTaskStart`).

Entry mới được auto-add khi:
- Friction lặp ≥2 lần (per `memoryRules.autoSaveOnFriction`).
- User explicitly nói "ghi nhớ" / "remember this".
- BA cảm thấy rule này không có sẵn trong skill global.

KHÔNG edit hồi tố. Sai entry → mark `retired` + add entry mới.

KHÔNG sync OS-level Claude memory. Scope engagement-only.

## Format

Mỗi entry append vào dưới với schema từ `_entry-template.md`.

## Entries

(empty — populated as engagement progresses)
