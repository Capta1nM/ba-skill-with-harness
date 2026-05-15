# Checklist — Scope (In / Out)

## Metadata required

- File path: `docs/domain/scope.md`
- Status: `draft | review | agreed | signed-off`

## DoR (vào `review`)

- [ ] In-scope: list module + REQ IDs cover by module.
- [ ] Out-of-scope: mỗi item có LÝ DO: deferred | replaced |
      owned-by-other-team | technically-infeasible.
- [ ] Out-of-scope items owned by other team có owner ghi rõ.
- [ ] Mọi RAW chưa xử lý phải xuất hiện hoặc in-scope hoặc out-of-scope.
      KHÔNG để RAW "treo".
- [ ] Phase 2 scope (nếu engagement multi-phase) tách rõ phase 1 vs
      phase 2.

## DoD (vào `agreed`)

- [ ] Sponsor agreed scope (walkthrough evidence ở
      `docs/validation/<date>-walkthrough-scope.md`).
- [ ] Mọi must-have REQ trong scope có ≥1 module owner.
- [ ] Đã review tradeoff: cái gì defer vì lý do gì.

## DoD (vào `signed-off`)

- Scope ký bởi sponsor + tech lead. Đè scope = high-risk change.

## Trace links bắt buộc

- Upstream: requirements/analyzed/, modules/.
- Downstream: BRD section 5 (Scope), HARNESS_BACKLOG.md nếu defer.

## Anti-patterns

- ❌ Out-of-scope không có lý do → khách hỏi sao defer, BA không trả
  lời được.
- ❌ "Phase 2 sẽ làm" mà không có Phase 2 plan → ngụy biện.
- ❌ Out-of-scope items được agent tự add (phải qua sponsor).
- ❌ Scope đổi sau khi signed-off mà không qua Change Request.
