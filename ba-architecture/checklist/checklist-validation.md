# Checklist — Validation Report

## Metadata required

- File path: `docs/validation/<date>-<type>-<scope>.md`
- Type: `crosscheck | walkthrough | signoff | peer-review`
- Status: `draft | review | agreed`

## DoR (vào `review`)

- [ ] Scope: artifact ID + version date.
- [ ] Method: manual crosscheck + checklist file used / walkthrough
      với STK-XXX (date, duration) / peer review by role.
- [ ] Artifacts in scope table: ID + version + status entering +
      status leaving.

## DoD (vào `agreed`)

- [ ] Findings table: F-ID + severity (block/major/minor/info) +
      affected artifact + resolution + owner.
- [ ] Sign-off section (nếu type=signoff): signing role + person +
      date + scope statement + conditions/caveats.
- [ ] Traceability impact: list rows updated trong matrix.
- [ ] Follow-up actions với owner.

## Severity rules

| Severity | Action required |
| --- | --- |
| block | Artifact KHÔNG được pass DoD. Fix trước khi continue. |
| major | Fix sớm. Có thể continue nhưng track. |
| minor | Note + add HARNESS_BACKLOG nếu pattern. |
| info | No action, ghi để awareness. |

## Sign-off specifics

Khi type=signoff cho BRD/SRS/PRD:

- [ ] Signing role: sponsor / accountable role / tech lead / PM /
      stakeholder owner.
- [ ] Date không phải ngày tương lai.
- [ ] Scope statement: phiên bản nào của artifact được sign-off (vd:
      "BRD v1.0 sections 1-9").
- [ ] Conditions/caveats: list cái chưa final nhưng OK ship.

## Trace links bắt buộc

- Upstream: artifacts being validated.
- Downstream: TRACEABILITY_MATRIX updates.

## Anti-patterns

- ❌ Sign-off "thông qua chat" không có file evidence.
- ❌ Mark block finding thành minor để workflow nhanh.
- ❌ Validation report không có method (làm sao verify?).
- ❌ Findings không có owner.
