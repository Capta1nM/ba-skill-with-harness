# Checklist — Change Request

## Metadata required

- ID prefix: `CR-`
- File path: `docs/validation/changesets/CR-<date>-<NNN>.md`
- Status: `proposed | approved | applied | rejected`

## When to open CR

- [ ] Change touches artifact `agreed` hoặc `signed-off` upstream.
- [ ] Phase sau phát hiện mâu thuẫn ép mở lại phase trước.
- [ ] Scope đổi sau khi scope.md signed-off.
- [ ] Methodology shape đổi sau khi đã chọn.
- [ ] NFR threshold đổi sau khi BRD/SRS agreed.

## DoR (vào `proposed`)

- [ ] Trigger: ai yêu cầu / session nào / finding nào (nếu CR từ
      crosscheck).
- [ ] Affected artifacts: list ID + cur status.
- [ ] Impact analysis: artifact nào downstream phải re-touch.
- [ ] Stakeholders re-notify list.
- [ ] Proposed update mỗi artifact (CHƯA động).

## DoD (vào `approved`)

- [ ] Sponsor/owner approve change.
- [ ] Đề xuất ADR (nếu chạm scope/methodology) đã thông qua.

## DoD (vào `applied`)

- [ ] Mọi affected artifact updated + status reflected.
- [ ] Stakeholders re-notified với date.
- [ ] TRACEABILITY_MATRIX updated.
- [ ] Old artifact version archived (note "supersedes by CR-XXX").

## Anti-patterns

- ❌ Edit artifact agreed mà không qua CR (silent change).
- ❌ Apply CR trước khi approved (skip gate).
- ❌ Skip stakeholder notification (họ tưởng artifact vẫn agreed cũ).
- ❌ CR không có impact analysis.
- ❌ CR cover nhiều unrelated changes → split.
