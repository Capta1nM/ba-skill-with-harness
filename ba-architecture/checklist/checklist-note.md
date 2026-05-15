# Checklist — Raw Note (MN/TR/EM/DOC/MSG/OBS/SUR)

## Metadata required

- ID prefix: `MN-` meeting | `TR-` transcript | `EM-` email | `DOC-` doc
  excerpt | `MSG-` chat | `OBS-` observation | `SUR-` survey
- File path: `docs/elicitation/notes/<PREFIX>-<event-date>-<slug>.md`
- Status: `captured | processed | superseded`
- Date in filename = event date, KHÔNG phải capture date.

## DoR (vào `captured`)

- [ ] ID + prefix đúng loại.
- [ ] Event date trong filename khớp event date trong metadata.
- [ ] Stakeholders involved listed (link STK ID nếu đã có).
- [ ] Source file(s) section filled: path tới attachment hoặc "manual
      dump, no source file" + lý do.
- [ ] Raw content: verbatim tối đa có thể; `[BA:]` cho ghi chú; `[?]`
      cho chỗ không rõ.
- [ ] Quick tag inline (#need/#nfr/#constraint/#assumption/#scope-in/
      #scope-out/#glossary/#decision/#followup) ở chỗ phù hợp.

## DoD (vào `processed`)

- [ ] ≥1 artifact downstream reference (SES/RAW/glossary/ADR).
- [ ] Section "Downstream References" trong note populated.
- [ ] Nếu liên quan session formal: SES-*.md tồn tại và link ngược.

## Trace links bắt buộc

- Upstream: nothing (note là evidentiary floor).
- Downstream: SES, RAW, glossary entry, ADR.

## Immutability rule

- KHÔNG edit nội dung note hồi tố.
- Nếu phát hiện sai/khách đính chính → tạo note mới + mark note cũ
  `supersedes <new-id>`, đổi status → `superseded`.

## Anti-patterns

- ❌ Paraphrase ngay khi capture (mất verbatim signal).
- ❌ Sửa lỗi chính tả/grammar của stakeholder.
- ❌ Filename không có date.
- ❌ Note "orphan" (không note tương ứng cho file attachment).
- ❌ Tag bậy bạ làm noise (chỉ tag ý chính, không tag mọi dòng).
