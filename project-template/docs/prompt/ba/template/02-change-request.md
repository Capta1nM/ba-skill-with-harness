# 🔄 Change Request

Dùng khi cần đổi artifact đã `agreed` hoặc `signed-off`. Cardinal Rule:
no silent change.

---

```
@ba-architecture

Type: Change Request
Trigger source: 📝 (vd "P6 crosscheck finding F-1" / "sponsor email
                  2026-06-13" / "Legal review found compliance gap")

Affected artifacts (ID list):
- 📝 (vd "BR-6.1 signed-off, SR-4.1.5 không tồn tại cần thêm, US-014 mới")

Why (business reason):
📝 (1-2 đoạn — vì sao change này cần thiết, hậu quả nếu không change)

Proposed change (rough — orchestrator sẽ refine):
📝 (vd "Add task priority field (high/medium/low) trên SCR-Backlog +
SCR-TaskCreate. Default medium.")

Stakeholders affected:
- 📝 (vd "STK-001 cần re-confirm BR-6.1 source list")

Urgency: 📝 (immediate | next-sprint | next-release)

Methodology impact: 📝 (yes/no — change này có ảnh hưởng methodology
shape đã chọn không? Vd: yêu cầu chuyển từ stories-only sang
prd-stories.)

Scope impact: 📝 (yes/no — change này có nằm trong scope hiện tại
không? Nếu out-of-scope → cần sponsor approve scope expansion.)
```

---

**Orchestrator sẽ:**

1. Dispatch `ba-validator` task=open-cr:
   - Tạo `docs/validation/changesets/CR-<date>-<NNN>.md`.
   - Impact analysis: artifact downstream phải re-touch.
   - Stakeholders re-notify list.
   - Proposed update per artifact (CHƯA động artifact).
2. Nếu methodology-impact=yes → dispatch `ba-methodology` skill, đề
   xuất ADR mới supersede ADR cũ.
3. Nếu scope-impact=yes → flag high-risk, AskUserQuestion confirm
   sponsor approval trước khi proceed.
4. Trình CR cho user approve (status: proposed).
5. Sau approve → orchestrator dispatch các phase-specific agent
   (brd-writer / spec-writer / story-writer / wireframe-architect)
   để execute updates.
6. Sync matrix per artifact change.
7. Re-notify stakeholders với date.
8. Status CR → applied. Đề xuất ADR nếu chạm scope/methodology.
