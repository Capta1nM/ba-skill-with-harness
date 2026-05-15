# ❓ Clarification

Dùng để clarify 1 ambiguity nhỏ: trả lời clarifying Q&A trong intake,
resolve glossary collision, confirm 1 decision, hoặc clear-up ambiguity
trong 1 artifact cụ thể.

KHÔNG dùng cho change request (artifact agreed) — dùng `02` cho cái đó.
KHÔNG dùng cho session capture — dùng `01`.

---

```
@ba-architecture

Type: Clarification
Subtype: 📝 (intake-qa | glossary-collision | decision-confirm |
            artifact-ambiguity | scope-question | stakeholder-question)

Target (file/section/ID):
📝 (vd "docs/elicitation/intake/2026-05-11-mkt-task.md mục Clarifying Q&A"
   vd "glossary entry 'Owner'"
   vd "REQ-012 statement"
   vd "scope item 'email auto-import'")

Câu hỏi / Ambiguity:
📝 (verbatim — câu hỏi đang treo, hoặc statement đang ambiguous)

Câu trả lời / Resolution (nếu user đã có ý):
📝 (vd "v1 chỉ manual capture, email auto-import defer v2"
   vd "Owner → split thành Campaign Owner + Task Owner"
   để trống nếu muốn agent đề xuất)

Source / Authority (ai quyết câu trả lời này):
📝 (vd "STK-001 trong 1:1 ngày 2026-05-14"
   vd "tech lead confirm qua Slack"
   vd "tôi quyết — BA lead")

Persist to:
📝 (vd "intake Q&A column"
   vd "glossary entry"
   vd "ADR mới"
   vd "MEMORY.md entry"
   default: orchestrator chọn dựa subtype)
```

---

**Orchestrator sẽ:**

1. Theo subtype:
   - `intake-qa` → update Clarifying Q&A trong intake file (cột Câu
     trả lời + cột Assumption/Decision). Đề xuất ASM/ADR nếu cần.
   - `glossary-collision` → dispatch `ba-domain-modeler` reconcile,
     update glossary, propose ADR nếu impact ≥1 module.
   - `decision-confirm` → tạo ADR `docs/decisions/<NNNN>-<title>.md`
     status Accepted với source.
   - `artifact-ambiguity` → identify artifact + dispatch
     phase-appropriate agent để clarify statement (KHÔNG đổi
     semantic, chỉ disambiguate).
   - `scope-question` → update scope.md hoặc đề xuất CR nếu scope
     đã signed-off.
   - `stakeholder-question` → cập nhật stakeholders.md hoặc note.
2. Verify: persist vào file (không kẹt trong chat).
3. Update matrix nếu artifact downstream affected.
4. Cardinal Rule: state on disk. Mọi câu trả lời clarifying PHẢI
   landing trên đĩa trước khi sang turn tiếp.
