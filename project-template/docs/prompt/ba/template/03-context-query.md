# 🧭 Context Query

"Ta đang ở đâu?" Dùng để agent báo cáo state engagement + đề xuất
next step. KHÔNG ghi file.

---

```
@ba-architecture

Type: Context Query
Scope: 📝 (full | phase=<P0..P6> | artifact=<ID> | stakeholder=<STK-ID>
       | module=<MOD-name>)

Question (optional, nếu muốn focus):
📝 (vd "Mọi REQ priority=must đã cover hết trong BRD chưa?"
   vd "Stakeholder nào còn chưa phỏng vấn?"
   vd "Wireframe SCR-Backlog có field gì chưa có SR backing?")
```

---

**Orchestrator sẽ:**

1. Đọc `.project-config.yml` + `docs/TRACEABILITY_MATRIX.md` +
   `docs/decisions/` + state phase từ artifact existence.
2. Theo scope:
   - `full` → báo cáo phase hiện tại, artifact đã agreed/signed-off,
     open issue, decision đã log, việc tiếp theo đề xuất.
   - `phase=Px` → exit gate checklist + gap list.
   - `artifact=<ID>` → forward trace + backward trace + impact list.
   - `stakeholder=<STK>` → sessions held, RAW từ stakeholder, REQ
     trace stakeholder.
   - `module=<MOD>` → REQ trong module, story, screen, status.
3. Nếu có Question → answer cụ thể với dẫn chứng file path.
4. **KHÔNG ghi file, KHÔNG dispatch worker agent.** Đây là read-only
   query.
5. Output cuối: đề xuất next action (KHÔNG tự thực hiện).
