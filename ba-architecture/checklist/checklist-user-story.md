# Checklist — User Story

## Metadata required

- ID prefix: `US-`
- File path: `docs/stories/epics/EPC-XXX/US-<id>-<slug>.md`
- Status: `draft | review | agreed | changed | retired`
- Epic: EPC-XXX
- Module: MOD-XXX
- Priority: MoSCoW

## DoR (vào `review`)

- [ ] Story follows: "As a `<role>` / I want `<capability>` / So that
      `<outcome>`".
- [ ] Acceptance Criteria ≥1, dạng Given/When/Then, testable.
- [ ] Module assigned.
- [ ] Trace links: BR + SR/CAP + REQ.
- [ ] INVEST check:
  - Independent (hoặc dependency declared).
  - Negotiable.
  - Valuable to user/business outcome.
  - Estimable.
  - Small (≤2 sprint).
  - Testable.
- [ ] Open questions resolved hoặc explicit defer.
- [ ] NFR touches: performance/security/accessibility/data nếu áp dụng.
- [ ] Out-of-scope for this story.

## DoD (vào `agreed`)

- [ ] Product owner accept.
- [ ] Tech lead confirm buildable trong current architecture.
- [ ] Cross-check BRD parent + glossary.
- [ ] Wireframe linked (nếu UI story).
- [ ] Traceability row updated.

## Trace links bắt buộc

- Upstream: epic + BR + SR/CAP + REQ + module.
- Downstream: wireframe screen(s), test cases (delivery).

## Anti-patterns

- ❌ AC restate requirement không thêm precision.
- ❌ AC dạng "hệ thống hoạt động" (không testable).
- ❌ Story too big (>2 sprint) — split.
- ❌ Story không có outcome cho user/business.
- ❌ Missing trace links (orphan story).
- ❌ "As a system / I want..." (system không phải role).
