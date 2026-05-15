# 🛠️ Harness Improvement

Dùng khi muốn sửa harness (skill / checklist / template / prompt / 
agent) — KHÔNG phải sửa artifact engagement.

---

```
@ba-architecture

Type: Harness Improvement
Subtype: 📝 (skill-update | checklist-update | template-update |
            prompt-update | agent-update | new-skill | new-checklist
            | new-template | new-prompt | new-agent | doc-fix)

Target file (nếu update existing):
📝 (vd "~/.claude/skills/ba-brd/skill.md"
   vd "docs/templates/brd.md"
   vd "docs/prompt/ba/template/01-elicitation-session.md")

Friction observed:
📝 (1-2 đoạn — vì sao cần improvement này. Tốt nhất kèm số lần friction
quan sát.)

Proposed change:
📝 (vd "thêm section 'NFR threshold rule' vào skill"
   vd "add tag #scope-creep vào quick tag list trong template note")

Impact:
- Engagement scope: 📝 (chỉ engagement này / mọi engagement / cả 2)
- Backward compatible: 📝 (yes/no — engagement đang dùng version cũ
  có cần update không?)
- Affected agents: 📝 (list agent IDs nếu có)
```

---

**Orchestrator sẽ:**

1. Phân loại impact:
   - **Engagement-local** (chỉ ảnh hưởng engagement này) → edit file
     local trong engagement folder.
   - **Global** (mọi engagement benefit) → propose edit file trong
     `~/.claude/skills/ba-*` hoặc `project-template/`.
2. Nếu global → đề xuất commit vào ba-skill repo + flag để propagate
   sang engagement đang chạy (re-bootstrap agents/ folder hoặc edit
   tay).
3. Nếu friction lặp ≥3 lần → đề xuất add MEMORY entry trước khi sửa
   harness (rule local) HOẶC propose harness change (rule global).
4. Sau approve → execute edit + log vào `docs/HARNESS_BACKLOG.md`
   (engagement) + đề xuất commit message cho ba-skill repo.
5. KHÔNG động artifact production (BRD, SRS, story, wireframe).
