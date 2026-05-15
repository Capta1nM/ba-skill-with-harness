# Checklist — Module Card

## Metadata required

- ID prefix: `MOD-`
- File path: `docs/domain/modules/MOD-<name>.md`
- Status: `draft | review | agreed`
- Owner: business role accountable

## DoR (vào `review`)

- [ ] ID + name + owner filled.
- [ ] Purpose: 1 đoạn business-language.
- [ ] Primary actors list.
- [ ] Headline capabilities ≥3.
- [ ] Upstream dependencies: source + input/trigger.
- [ ] Downstream dependencies: consumer + output.
- [ ] Key domain concepts (link glossary).
- [ ] Linked requirements: REQ-XXX list.

## DoD (vào `agreed`)

- [ ] Sponsor/accountable role agreed module decomposition.
- [ ] Mọi must-have REQ map vào module này hoặc module khác (không
      orphan REQ).
- [ ] Module không overlap capability với module khác (mỗi capability
      thuộc 1 owner module).

## Trace links bắt buộc

- Upstream: requirements/analyzed/ (REQs assigned).
- Downstream: BRD section 5 (Scope, by module), stories grouped by
  module, wireframes grouped by module.

## Anti-patterns

- ❌ Module = microservice (technical decomposition).
- ❌ "Capability" mơ hồ ("manage users") thay vì action-oriented.
- ❌ Module không có owner (ai chịu trách nhiệm?).
- ❌ Module overlap (2 module cùng own 1 capability).
