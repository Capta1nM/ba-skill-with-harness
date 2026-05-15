---
name: ba-requirement-analysis
description: Phase 2 skill. Promote RAW statements → analyzed REQ/NFR/CON/ASM. Group by need, reconcile via glossary, write atomic testable statements, propose to user (CHƯA tự ghi file). Update traceability matrix sau confirm.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-requirement-analysis — Phase 2 Analysis Skill

## Mục đích

Chuyển RAW statements (verbatim) thành analyzed requirements (atomic,
testable, traceable).

## Workflow

```text
1. Read all RAW trong docs/requirements/raw/
        |
        v
2. Group RAW by need
        - 2 stakeholder dùng từ khác → reconcile qua glossary
        - 1 stakeholder nói 2 thứ → split thành 2 RAW group
        |
        v
3. For each group, propose 1 REQ/NFR/CON/ASM
        Output table (CHƯA ghi file):
        REQ-ID dự kiến | Type | Module | Statement | Source RAWs |
        Priority | Câu hỏi cần làm rõ | Mâu thuẫn
        |
        v (user confirm)
4. Write file docs/requirements/analyzed/<ID>.md per template
        Pass DoR checklist-requirement.md.
        |
        v
5. Update RAW: status = promoted, downstream refs filled.
        |
        v
6. Update TRACEABILITY_MATRIX (cột Req ID + Source Note/Session/Raw).
```

## Type classification

| Type | Prefix | Khi nào |
| --- | --- | --- |
| Functional requirement | `REQ-` | System shall do X (behavior). |
| Non-functional | `NFR-` | Quality attribute: performance, security, availability, etc. |
| Constraint | `CON-` | External constraint: regulation, tech, budget, time. |
| Assumption | `ASM-` | Inferred without explicit confirmation; needs validation. |

ASM bắt buộc khi promote RAW nào có `[BA-inferred]` marker.

## Atomic rule

Statement KHÔNG được join 2 behavior độc lập bằng "and"/"or":

❌ "The system shall create and assign and notify."
✅ Split thành 3 REQ riêng.

## Testable rule

Mỗi REQ phải có ≥1 acceptance condition Given/When/Then. Nếu không
viết được → REQ chưa atomic hoặc chưa rõ.

## NFR threshold rule

NFR bắt buộc threshold đo được:

❌ "System shall be fast."
✅ "System shall respond to backlog query within 2 seconds at p95
    under 500 concurrent users."

## Priority MoSCoW

| Priority | Khi nào |
| --- | --- |
| `must` | Engagement fail nếu thiếu. Sponsor đồng ý. |
| `should` | Quan trọng, defer chỉ khi must full. |
| `could` | Nice-to-have. |
| `wont` | Out-of-scope phase này, có thể phase sau. |

Mặc định: nếu chưa quyết, mark draft + tag `priority-tbd` + flag follow-up
cho sponsor.

## Reconciliation

Khi 2 RAW cùng need nhưng:

1. **Cùng nghĩa, khác từ** → merge thành 1 REQ. Add cả 2 RAW vào
   Source. Update glossary mapping.
2. **Khác nghĩa, cùng từ** → split thành 2 REQ. Glossary phải reconcile
   trước.
3. **Mâu thuẫn** → KHÔNG promote. Flag cho user. Đề xuất reconciliation
   session.

## Anti-patterns

- ❌ Tự promote không qua user confirm.
- ❌ Statement giải pháp ("dùng Redis cache").
- ❌ NFR không đo được.
- ❌ Skip ASM marker cho inferred statement.
- ❌ Mark `must` mà sponsor chưa confirm.
- ❌ Atomic violation (and/or join).
- ❌ Promote RAW mâu thuẫn mà không flag.
