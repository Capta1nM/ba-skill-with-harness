---
name: ba-validation
description: Cross-cutting skill. Validation reports (crosscheck/walkthrough/signoff/peer-review) + Change Requests. Sign-off evidence file. No silent change to agreed artifact.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-validation — Cross-Cutting Validation Skill

## Mục đích

3 nhóm việc:

1. **Crosscheck reports** — verify artifact pair (BRD vs REQ, Wireframe
   vs SRS, ...).
2. **Walkthrough / Peer review / Sign-off evidence** — capture acceptance.
3. **Change Requests** — manage change to agreed/signed-off artifact.

## File location

```text
docs/validation/
  <date>-crosscheck-<scope>.md
  <date>-walkthrough-<artifact>.md
  <date>-signoff-<artifact>.md
  <date>-peer-review-<artifact>.md
  changesets/
    CR-<date>-<NNN>.md
```

## Crosscheck workflow

```text
1. Identify scope (artifact pair)
        e.g. "all stories vs BRD", "all wireframes vs SRS sec 4"
        |
        v
2. Define method
        Manual walkthrough / checklist file / scripted query
        |
        v
3. Run check, capture findings
        Severity: block / major / minor / info
        Mỗi finding: affected artifact, resolution proposed, owner
        |
        v
4. Output docs/validation/<date>-crosscheck-<scope>.md
        |
        v
5. Resolve findings (artifact fix OR open CR OR add to backlog)
        |
        v
6. Re-check nếu fix lớn
        |
        v
7. Update TRACEABILITY_MATRIX
```

## Walkthrough workflow

```text
1. Schedule walkthrough với stakeholder owner
        |
        v
2. During session: confirm artifact reflects intent
        |
        v
3. Capture docs/validation/<date>-walkthrough-<artifact>.md
        - Who walked through
        - Date + duration
        - Artifact ID + version
        - Feedback captured (verbatim where possible)
        - Decisions made
        |
        v
4. Update artifact với feedback (if any)
        |
        v
5. Status: agreed (only after walkthrough recorded)
```

## Sign-off workflow

ONLY cho BRD, SRS, PRD (document-level).

```text
1. All review feedback addressed
        |
        v
2. Sign-off session với sponsor/accountable role
        |
        v
3. Capture evidence file:
        - Signing role + person
        - Date (current)
        - Scope statement (which version)
        - Conditions/caveats
        |
        v
4. Artifact status → signed-off
        |
        v
5. Matrix Evidence column updated
```

## Change Request workflow

```text
1. Trigger detected
        - Artifact agreed/signed-off cần đổi
        - Phase sau phát hiện mâu thuẫn phase trước
        - Scope change
        - Methodology change
        - NFR threshold change
        |
        v
2. Open CR docs/validation/changesets/CR-<date>-<NNN>.md
        Pass DoR checklist-change-request.md.
        - Trigger source
        - Affected artifacts
        - Impact analysis
        - Stakeholders re-notify
        - Proposed update per artifact
        |
        v (sponsor/owner approval)
3. Status: proposed → approved
        |
        v
4. Execute updates (per artifact)
        Mỗi update sync matrix.
        |
        v
5. Stakeholders re-notified với date
        |
        v
6. Status CR: approved → applied
        |
        v
7. ADR nếu chạm scope/methodology
```

## Anti-patterns

- ❌ Sign-off informal (chat/email không file).
- ❌ Mark block finding thành minor để workflow nhanh.
- ❌ Edit agreed artifact silent (without CR).
- ❌ Apply CR trước khi approved.
- ❌ Skip stakeholder re-notification.
- ❌ Findings không có owner.
- ❌ Crosscheck "looks good" không method statement.
