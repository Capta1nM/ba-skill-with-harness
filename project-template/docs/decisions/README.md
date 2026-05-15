# Decisions — {ENGAGEMENT_NAME}

ADR log cho engagement.

Mỗi decision lớn (scope, methodology, glossary collision impact ≥1
module, sign-off deviation) phải log ADR ở đây.

## Files

- `_template.md` — ADR schema.
- `0001..NNNN-<title>.md` — ADRs.

## Numbering

Tuần tự từ 0001. KHÔNG re-use number retired.

## ADR mẫu kế thừa từ harness-ba (reference, có thể delete cho engagement mới)

- `0001-harness-first-ba-workflow.md`
- `0002-six-phase-loop.md`
- `0003-traceability-as-control-panel.md`

Khi engagement bắt đầu thật, 3 ADR mẫu nên:

- Giữ nguyên: nếu engagement đồng ý với harness baseline.
- Supersede bằng ADR mới: nếu engagement có rule khác.
- Delete: nếu engagement không cần reference (rare).

## ADR cần log riêng cho engagement

Phổ biến nhất (theo thứ tự thường gặp):

| # | Khi nào |
| --- | --- |
| ADR methodology | Phase 5 entry (SRS vs PRD vs Stories-only) |
| ADR glossary collision resolution | Khi reconcile term với impact ≥1 module |
| ADR scope change | Khi scope sau sponsor walkthrough đổi |
| ADR NFR threshold | Khi NFR threshold deviate từ industry default |
| ADR vendor handover format | Nếu vendor handover yêu cầu format đặc thù |

## Add a decision when

- A locked technical choice changes.
- A product rule changes meaningfully.
- A validation requirement is added, removed, or weakened.
- A high-risk feature chooses one design over another.
- The source-of-truth hierarchy changes.
