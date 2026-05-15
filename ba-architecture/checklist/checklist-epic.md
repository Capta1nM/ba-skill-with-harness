# Checklist — Epic

## Metadata required

- ID prefix: `EPC-`
- File path: `docs/stories/epics/EPC-<id>-<name>/epic.md`
- Status: `draft | review | agreed | changed | retired`
- Module: MOD-XXX
- Owner: product/BA

## DoR (vào `review`)

- [ ] ID + name + module + owner filled.
- [ ] Business Outcome: trace OUT-XX (PRD) hoặc OBJ-XX (BRD).
- [ ] Source: BR + SR/CAP + REQs.
- [ ] Description 1-2 đoạn.
- [ ] Stories included: bảng US-IDs + title + status.
- [ ] Out-of-scope cho epic: list.
- [ ] Open questions.

## DoD (vào `agreed`)

- [ ] Product owner accept epic decomposition.
- [ ] Mọi included story đã DoR pass.
- [ ] Stories cover end-to-end outcome (không gap).

## Trace links bắt buộc

- Upstream: BR, SR/CAP, REQs, module.
- Downstream: user stories, wireframes.

## Anti-patterns

- ❌ Epic không có measurable outcome.
- ❌ Stories trong epic không related (sai grouping).
- ❌ Epic quá to (>10 story) — split.
- ❌ Epic quá nhỏ (1 story) — promote story thành standalone.
