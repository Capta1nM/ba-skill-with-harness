# Intake

Every stakeholder prompt enters the intake gate before it becomes BA work.
A new engagement also enters through this gate before any artifact is
produced.

The human does not need to classify phase or risk. The harness does.

## Intake Flow

```text
User / stakeholder prompt
        |
        v
Classify input type
        |
        v
Restate as BA work item
        |
        v
Identify phase (P1 - P6) or harness improvement
        |
        v
Locate affected artifacts and traceability rows
        |
        v
Run risk checklist
        |
        v
Choose lane: tiny, normal, or high-risk
```

## Input Types

| Type | Use when | Lands in |
| --- | --- | --- |
| New engagement | First stakeholder request for a new project | Phase 1 prep + intake form |
| Phase activity | Activity inside an active phase (e.g. an interview, BRD section) | Phase-appropriate artifact |
| Change request | Change to an already-agreed artifact (requirement, BRD, SRS, story, screen) | Validation changeset + upstream artifact |
| Clarification | Question whose answer updates glossary, requirement, or open issue | Glossary or requirement item |
| Methodology choice | Decision about SRS vs PRD, agile vs waterfall, wireframe tool, etc. | `docs/decisions/` |
| Harness improvement | Improvement to templates, gates, rules, or workflow | Direct docs update or `docs/HARNESS_BACKLOG.md` |

## Phase Routing

After input type is set, route to the affected phase:

| Signal in the prompt | Likely phase |
| --- | --- |
| "We need to talk to / interview / workshop with..." | P1 Elicitation Prep |
| "Here is the transcript / notes from..." | P2 Elicitation Execution |
| "What does X mean / two teams disagree on..." / "Is X in scope?" | P3 Domain Mapping |
| "Write up the business requirements / objectives / success metrics..." | P4 BRD |
| "Specify how feature X should behave / draft user stories for..." | P5 SRS / PRD + Stories |
| "Draw screens for / what does this page look like..." | P6 Wireframes |
| "The wireframe says X but SRS says Y" | Change request — re-opens affected phase |

If the prompt spans multiple phases, decompose into multiple work items, each
routed independently.

## Lanes

### Tiny

Use for low-risk edits, typo fixes, naming alignment, single-cell traceability
updates, glossary clarifications without semantic change.

Requirements:

- Patch directly.
- Keep affected traceability rows current.
- Run the artifact's quality gate.
- Update the harness only if friction was found.

### Normal

Use for phase activities with bounded blast radius: one interview, one BRD
section, one story, one screen.

Requirements:

- Use the appropriate template under `docs/templates/`.
- Link to upstream artifacts (source, parent requirement, parent BRD section).
- Run the artifact's quality gate before marking ready.
- Update `docs/TRACEABILITY_MATRIX.md`.
- Update artifact status (`draft -> review -> agreed`).

### High-Risk

Use when the work can affect scope boundaries, sponsor sign-off, compliance,
already-agreed artifacts, or stakeholder commitments.

Requirements:

- Pause and confirm with the human before producing the artifact change.
- If change touches a signed-off BRD or agreed SRS: open a change request
  under `docs/project/validation/`.
- Record a decision in `docs/decisions/` when scope, methodology, or
  artifact shape changes.
- Re-run downstream cross-checks and update traceability.

## Risk Checklist

Mark one flag for each item that applies:

| Risk flag | Applies when the work touches |
| --- | --- |
| Scope | in-scope/out-of-scope list, module boundary, deferred items |
| Sign-off | a BRD/SRS already signed off; sponsor or accountable role |
| Compliance | regulatory, audit, privacy, accessibility, retention requirements |
| Cross-stakeholder | requirement that two or more stakeholder groups disagree on |
| Non-functional | performance, availability, security thresholds |
| External system | integration, third-party API, data exchange contract |
| Migration | replacing existing process or system; data carry-over |
| Domain language | term that already exists in glossary with different meaning |
| Methodology | the chosen artifact shape (SRS vs PRD vs US-only) |
| Cascading | change forces re-open of an earlier phase |

## Classification

```text
0-1 flags:
  tiny or normal, based on artifact impact

2-3 flags:
  normal with stronger cross-check and explicit review request

4+ flags:
  high-risk

Any hard gate:
  high-risk unless the human explicitly narrows scope in writing
```

Hard gates:

- Scope boundary change after Phase 3 exit.
- Change to a signed-off BRD.
- Compliance or regulatory requirement.
- Methodology shape decision.
- Cross-stakeholder disagreement that cannot be reconciled by glossary fix.

## Output

At the end of intake, the agent should be able to say:

```text
Input type: phase activity
Phase: P5 SRS / PRD + Stories
Lane: normal
Reason: drafting acceptance criteria for an existing user story.
Affected artifacts: docs/project/stories/epics/E02-onboarding/US-014.md,
  docs/project/srs/srs.md section 4.3, traceability row REQ-042.
Quality gate: story DoR.
Cross-checks: BRD section 5.2 (Onboarding), glossary terms "Customer",
  "Identity".
Next step: produce acceptance criteria draft, request product owner review.
```
