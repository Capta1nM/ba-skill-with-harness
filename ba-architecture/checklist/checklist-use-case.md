# Checklist — Use Case

Dùng khi engagement leaning IEEE/RUP (SRS shape), khi flow phức tạp với
nhiều alternative, hoặc khi audit yêu cầu scenario doc.

## Metadata required

- ID prefix: `UC-`
- File path: `docs/stories/epics/EPC-XXX/UC-<id>-<slug>.md`
- Status: `draft | review | agreed | changed | retired`
- Module: MOD-XXX
- Primary actor + secondary actors + trigger filled.

## DoR (vào `review`)

- [ ] Trace BR + SR + REQ.
- [ ] Preconditions list.
- [ ] Postconditions: success + failure.
- [ ] Basic flow: ≥3 step, đánh số.
- [ ] Alternative flows ≥1 (A1, A2, ...): branch point + steps.
- [ ] Exception flows ≥1 (E1, ...): trigger + steps.
- [ ] Business rules referenced (link REQ).
- [ ] UI/Screens: SCR-XXX list.
- [ ] NFR touches.

## DoD (vào `agreed`)

- [ ] Product owner + tech lead confirm.
- [ ] Cross-check SRS clauses cover by use case.

## Trace links bắt buộc

- Upstream: epic + BR + SR + REQ + module.
- Downstream: wireframes, tests.

## Anti-patterns

- ❌ Basic flow không có happy path rõ.
- ❌ Skip alternative/exception flows.
- ❌ Use case = task list của developer.
- ❌ Actor không khớp với primary actor trong stakeholders.md.
