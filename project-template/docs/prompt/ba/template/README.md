# BA Prompt Library — {ENGAGEMENT_NAME}

8 prompt intake-form cho 8 loại task. Orchestrator (`ba-architecture`)
auto-discover state + dispatch sub-agent, KHÔNG cần user drive từng
step.

## Triết lý

Mỗi prompt = **intake form** cho 1 task type. Điền các trường `📝`,
gửi. Orchestrator:

1. Đọc state engagement (`.project-config.yml` + `docs/`).
2. Phân loại task qua RISK_LANES.
3. Dispatch đúng sub-agent.
4. Apply quality gate.
5. Update matrix.
6. Hỏi user CHỈ tại confirmation point (methodology decision, scope
   change, signed-off artifact change, ...).
7. Đề xuất next step.

User KHÔNG cần biết phase nào, dispatch agent nào, file gì cần ghi.
Đó là việc orchestrator.

## Khi nào dùng prompt nào

| Bạn muốn | Prompt |
| --- | --- |
| Bắt đầu engagement mới với đề bài khách | `00-new-engagement.md` |
| Vừa xong buổi phỏng vấn / workshop / có email khách / có file khách share | `01-elicitation-session.md` |
| Đổi artifact đã agreed/signed-off | `02-change-request.md` |
| "Ta đang ở đâu? Việc tiếp theo gì?" | `03-context-query.md` |
| Mở session mới sau khi nghỉ / handover BA khác | `04-handoff-resume.md` |
| Sửa harness/skill/checklist/template | `05-harness-improvement.md` |
| Clarify 1 term, 1 decision, 1 ambiguity nhỏ | `06-clarification.md` |
| Raw input từ file lớn / paste content thô | `utility/DUMP-note.md` |
| Agent đi lạc khỏi quy trình | `utility/STOP-violation.md` |

## Pattern chung

Mỗi prompt có:

- `@ba-architecture` mention để invoke orchestrator.
- `Type:` xác định task type (Engagement / Elicitation / Change / ...).
- Các trường `📝` cho user điền.
- Orchestrator block ở cuối liệt kê auto-actions.

## Khi prompt không vừa

→ Đó là dấu hiệu **harness thiếu** task type. Dùng
`05-harness-improvement.md` đề xuất thêm prompt template mới hoặc
update existing.

KHÔNG tự viết prompt ad-hoc cho task type lặp lại — đó là friction
cần fix ở harness level.

## Một số nguyên tắc

- **Mỗi prompt 1 task type.** Không gộp 2-3 task vào 1 prompt.
- **Form fields cụ thể.** "📝 verbatim từ khách" thay vì "tự nghĩ".
- **Orchestrator action block ở cuối** giúp user predict được agent
  sẽ làm gì.
- **No phase manual drive.** Orchestrator tự xác định phase từ state.
