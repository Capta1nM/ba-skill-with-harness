# Checklist — Context Map

## Metadata required

- File path: `docs/domain/context-map.md`
- Status: `draft | review | agreed`

## DoR (vào `review`)

- [ ] Purpose statement 1 đoạn.
- [ ] Actors table: human + system, type, role, notes.
- [ ] Bounded contexts/modules diagram (ASCII OK, mermaid OK, image link
      OK).
- [ ] Key flows: mỗi flow business chính có step + owner module.
- [ ] Integration points: source → target, direction, data, trigger,
      sync/async.
- [ ] Language boundaries: term cùng tên khác nghĩa giữa context.
- [ ] Out-of-scope (cho map): item không model + lý do.

## DoD (vào `agreed`)

- [ ] Sponsor hoặc accountable role agreed.
- [ ] Mọi REQ map vào ≥1 module (qua module catalog).
- [ ] Diagram dễ đọc cho non-tech stakeholder.

## Trace links bắt buộc

- Upstream: requirements/analyzed/, glossary.md.
- Downstream: modules/MOD-*.md, scope.md, BRD section 8 (Business
  Process View).

## Anti-patterns

- ❌ Module từ system architecture (microservice) thay vì business
  capability.
- ❌ Diagram quá phức tạp (>15 box) — split context map.
- ❌ Bỏ qua external system / 3rd-party integration.
- ❌ Không có language boundary khi có nhiều context.
