# Checklist — Glossary Entry

## Metadata required

- File path: `docs/domain/glossary.md` (project-level, extends harness
  glossary, không thay thế).
- Per-term: term, definition, source, synonyms, counter-examples (nếu
  rủi ro nhầm).

## DoR (vào `review`)

- [ ] Term xuất hiện ≥2 lần trong RAW/REQ hoặc ≥1 lần với nghĩa không
      rõ.
- [ ] Definition 1-3 câu, dùng từ thông dụng.
- [ ] Source: RAW/SES/Note ID hoặc external reference.
- [ ] Synonyms list (nếu có).
- [ ] Counter-example (nếu term có rủi ro nhầm với term khác).

## DoD (vào `agreed`)

- [ ] Conflicting prior usages reconciled hoặc explicit
      context-specific.
- [ ] Used consistently trong ≥1 downstream artifact.
- [ ] Stakeholder owner term confirmed definition.

## Trace links bắt buộc

- Upstream: RAW/Note source.
- Downstream: REQ/BR/SR/US dùng term này.

## Reconciliation rule

Khi cùng term, 2 stakeholder hiểu khác nghĩa:

1. KHÔNG silent merge.
2. List cả 2 nghĩa với context "Context A: ... / Context B: ...".
3. Đề xuất reconciliation session với cả 2 stakeholder.
4. Sau session: chọn 1 nghĩa primary HOẶC split thành 2 term.
5. Log decision vào ADR nếu impact ≥1 module.

## Anti-patterns

- ❌ Định nghĩa tuần hoàn (term A định nghĩa bằng term B, B bằng A).
- ❌ Skip counter-example khi rủi ro nhầm cao.
- ❌ Đánh dấu term agreed khi vẫn còn 2 stakeholder hiểu khác.
- ❌ Định nghĩa dùng từ chuyên ngành chưa giải thích.
