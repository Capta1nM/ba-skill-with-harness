---
name: ba-elicitation-capture
description: Phase 2 skill. Capture raw notes (MN/TR/EM/DOC/MSG/OBS/SUR) lên `docs/elicitation/notes/`. Structure note → session log → raw statements. Dump first, structure later. Verbatim is mandatory.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-elicitation-capture — Phase 2 Capture Skill

## Mục đích

Đưa raw material lên đĩa với schema rõ ràng để các phase sau truy vết.

## Cardinal Rule

- **Verbatim mandatory.** Note ở `docs/elicitation/notes/` giữ nguyên
  văn. Paraphrase = defect.
- **Dump first, structure later.** Note ngay sau event. Session log
  + RAW statement extract sau khi rảnh.
- **Immutability của notes.** Note KHÔNG edit hồi tố. Đính chính = note
  mới + `supersedes <old-id>`.

## Workflow

```text
1. Raw event happens (meeting/email/file/observation)
        |
        v
2. Dump note vào docs/elicitation/notes/<PREFIX>-<date>-<slug>.md
        - Cách A: file đính kèm vào notes/attachments/, prompt point path.
        - Cách B: text ngắn (< 50 dòng), paste vào prompt.
        - Status: captured.
        |
        v
3. Khi có thời gian: structure session log
        docs/elicitation/sessions/SES-<date>-<slug>.md
        reference ≥1 note.
        |
        v
4. Extract RAW statements vào docs/requirements/raw/RAW-<id>.md
        mỗi RAW reference: note + SES + stakeholder.
        |
        v
5. Update note: status processed, downstream refs filled.
        |
        v
6. Update TRACEABILITY_MATRIX (cột Source Note, Session, Raw Stmt).
```

## ID schema

| Type | Prefix | Source |
| --- | --- | --- |
| Meeting note | `MN-YYYY-MM-DD-<slug>` | họp, workshop, sync, 1:1 |
| Transcript | `TR-YYYY-MM-DD-<slug>` | audio/video to text |
| Email | `EM-YYYY-MM-DD-<slug>` | thư từ stakeholder |
| Document | `DOC-YYYY-MM-DD-<slug>` | file khách share (excerpt) |
| Chat message | `MSG-YYYY-MM-DD-<slug>` | Slack/Teams/Zalo thread |
| Observation | `OBS-YYYY-MM-DD-<slug>` | shadowing, quan sát thực địa |
| Survey | `SUR-YYYY-MM-DD-<slug>` | khảo sát |
| Session log | `SES-YYYY-MM-DD-<slug>` | structured log on top of note(s) |
| Raw statement | `RAW-<NNN>` | atomic statement extracted |

Date trong filename = ngày event xảy ra, KHÔNG phải ngày capture.

## Quick tag inline

Khi structure note, đánh dấu trong Raw Content bằng tag:

- `#need` — câu nói lên need/pain
- `#nfr` — non-functional hint
- `#constraint` — ràng buộc
- `#assumption` — giả định BA hoặc stakeholder
- `#scope-in` / `#scope-out` — gợi ý scope
- `#glossary` — term chưa định nghĩa
- `#decision` — quyết định chốt trong họp
- `#followup` — câu hỏi cần verify sau

Đánh dấu ý chính. KHÔNG tag mọi dòng.

## BA-inferred rule

Khi BA paraphrase hoặc infer ý không có verbatim:

- `[BA:]` prefix cho mọi ghi chú BA.
- `[?]` cho chỗ nghe không rõ.
- Inferred statement đưa vào RAW phải đánh dấu `[BA-inferred]` + flag là
  `ASM-` (assumption).

## Promote RAW → REQ rule

KHÔNG tự promote. Chỉ đề xuất:

1. Đọc toàn bộ RAW trong `requirements/raw/`.
2. Group RAW theo need (qua glossary reconciliation).
3. Mỗi nhóm đề xuất 1 REQ/NFR/CON/ASM (CHƯA ghi file).
4. Trình bảng cho user review.
5. User confirm → mới ghi file + update matrix.

Promote là việc của skill `ba-requirement-analysis`, capture skill chỉ
extract RAW.

## Anti-patterns

- ❌ Paraphrase verbatim khi capture.
- ❌ Sửa lỗi chính tả stakeholder trong note.
- ❌ Note "orphan" (file dump không có note .md tương ứng).
- ❌ Session log không reference note.
- ❌ Tự promote RAW → REQ không qua user.
- ❌ Edit note hồi tố.
