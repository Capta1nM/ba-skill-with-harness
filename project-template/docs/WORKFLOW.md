# BA Workflow

The harness models BA work as six phases. Phases are gated, not strictly
sequential: late-phase findings may re-open earlier phases through an explicit
change request, but no phase's exit gate can be skipped.

## Phase Overview

| # | Phase | Goal | Primary Output | Exit Gate |
| --- | --- | --- | --- | --- |
| P1 | Elicitation Prep | Know what to ask, whom to ask, and how | Elicitation plan, stakeholder register, interview guide, workshop agenda, question bank | Plan reviewed; sessions scheduled |
| P2 | Elicitation Execution | Capture raw requirements and constraints | Session logs, raw requirement statements | Each session logged; raw statements parked in catalog |
| P3 | Domain Mapping & Scope | Define the language and boundary | Glossary, context map, module catalog, in/out-of-scope list | Sponsor agrees scope and primary modules |
| P4 | BRD | Lock business intent and success criteria | Business Requirements Document | Sponsor sign-off |
| P5 | SRS / PRD + User Stories | Specify functional and non-functional behavior at delivery granularity | SRS or PRD, epics, user stories | Tech lead + product owner agree spec is buildable |
| P6 | Wireframes | Visualize each screen and reconcile with spec | Wireframe screen specs, cross-check report | All screens cross-checked against SRS; UX review passed |

## Phase 1 — Elicitation Preparation

**Goal:** Reach Phase 2 with a plan that maximizes signal per stakeholder hour.

**Inputs:**

- Stakeholder request (ticket, email, transcript).
- Any prior project context the customer shares.
- The harness question bank (`docs/templates/question-bank.md`).

**Activities:**

1. Identify stakeholders and their roles using
   `docs/templates/stakeholder-register.md`.
2. Build the elicitation plan
   (`docs/templates/elicitation-plan.md`): techniques, sessions, dependencies,
   timeline.
3. Draft an interview guide per stakeholder type
   (`docs/templates/interview-guide.md`).
4. If workshops are planned, draft an agenda
   (`docs/templates/workshop-agenda.md`).
5. Expand the question bank where existing categories do not cover the
   domain.

**Exit Gate:**

- Stakeholder register reviewed by sponsor or project lead.
- Elicitation plan covers every named stakeholder at least once.
- Interview/workshop materials avoid leading questions and contain at least
  one open-ended exploration prompt per topic.
- All Phase 1 artifacts pass `docs/QUALITY_GATES.md` checklist for elicitation
  prep.

**Common Failure Modes:**

- Designing questions around the BA's assumed solution.
- Skipping secondary stakeholders (compliance, ops, support).
- Treating the first interview as the elicitation plan.

## Phase 2 — Elicitation Execution

**Goal:** Capture raw, sourced statements from each stakeholder session.

**Inputs:**

- Phase 1 plan and guides.
- Live sessions (interviews, workshops, observation, document review,
  surveys).

**Activities:**

1. Run each session per its guide. Capture session log with
   `docs/templates/observation-log.md` style (or interview log variant).
2. Park every raw statement in `docs/project/requirements/raw/`. Each raw
   statement keeps:
   - Source (stakeholder name + session ID).
   - Verbatim or paraphrased text.
   - Initial classification guess (functional, NFR, constraint, assumption,
     out-of-scope, glossary candidate).
3. Capture follow-up questions immediately; do not let them die in the
   transcript.
4. Promote raw statements to analyzed requirement items
   (`docs/templates/requirement-item.md`) as they mature.

**Exit Gate:**

- Every planned session has a logged outcome (held, deferred, cancelled with
  reason).
- Every raw statement has a source citation.
- Every analyzed requirement has a unique ID, source link, and at least one
  proposed acceptance condition.

**Common Failure Modes:**

- Cleaning statements during capture (loses verbatim signal).
- Forgetting to track non-functional and constraint statements.
- Allowing the BA's interpretation to overwrite the stakeholder's wording.

## Phase 3 — Domain Mapping & Scope

**Goal:** Establish shared language and a defensible scope boundary before
writing the BRD.

**Inputs:**

- Analyzed requirements catalog.
- Stakeholder register.
- Any existing system documentation, regulatory references, or industry
  references.

**Activities:**

1. Build the project glossary in `docs/project/domain/glossary.md` (extends
   the harness glossary, does not replace it).
2. Draw a context map using `docs/templates/domain-context-map.md` showing:
   bounded contexts, actors, external systems, key flows.
3. Catalog modules using `docs/templates/module-card.md`. Each module names
   its purpose, primary actors, headline capabilities, and upstream/downstream
   dependencies.
4. Produce an explicit in-scope / out-of-scope list. Out-of-scope items must
   say *why* (deferred, replaced, owned by another team, technically
   infeasible).
5. Reconcile naming collisions in the glossary before they propagate.

**Exit Gate:**

- Sponsor or accountable role agrees scope and module list.
- Every requirement maps to at least one module, or is explicitly parked.
- Glossary covers every domain term that appears in two or more requirements.

**Common Failure Modes:**

- Letting two stakeholders use the same word for different things (or vice
  versa) without reconciling.
- Defining modules from system architecture instead of business capability.
- Treating "phase 2 scope" as out-of-scope without recording the deferral.

## Phase 4 — BRD

**Goal:** A signed business contract: what we are building, for whom, why,
and how we know it succeeded.

**Inputs:**

- Analyzed requirements catalog.
- Domain map and module catalog.
- Decisions made during Phase 3 about scope and methodology.

**Activities:**

1. Compose the BRD using `docs/templates/brd.md`. Each BRD section must trace
   to one or more requirement IDs in the catalog.
2. Capture business objectives, success metrics, constraints, assumptions,
   risks, stakeholders, scope, and high-level functional + non-functional
   requirements.
3. Run cross-check: every business requirement in the BRD points to a source
   in the catalog; every must-have requirement in the catalog appears in the
   BRD or is explicitly excluded.
4. Circulate for stakeholder review; capture comments and changes.
5. Obtain sponsor sign-off; record it in `docs/project/validation/`.

**Exit Gate:**

- BRD signed by sponsor with date and scope statement.
- Traceability matrix shows every must-have requirement mapped to a BRD
  section.

**Common Failure Modes:**

- BRD that contains design or UI decisions (those belong in SRS or
  wireframes).
- Success metrics that cannot be measured.
- Missing non-functional and compliance requirements.

## Phase 5 — SRS / PRD + User Stories

**Goal:** Specify behavior precisely enough for the delivery team to commit.

**This phase requires a methodology decision.** Before starting Phase 5, the
BA must confirm with the project lead which of the following shapes the
engagement uses, and record the choice in `docs/decisions/`:

- **SRS-only:** IEEE-style System Requirements Specification, classic
  waterfall-friendly. Stories optional.
- **PRD + Stories:** Product Requirements Document covering the product
  vision and outcomes, paired with epics and user stories for delivery.
- **Stories-only (lightweight):** Epics + user stories with embedded acceptance
  criteria, no separate SRS or PRD. Reserved for small or highly iterative
  engagements.

The harness provides templates for all three shapes (`docs/templates/srs.md`,
`docs/templates/prd.md`, `docs/templates/epic.md`,
`docs/templates/user-story.md`, `docs/templates/use-case.md`). Do not start
drafting without picking one and logging the choice.

**Activities (after the shape is chosen):**

1. Draft the chosen artifact set. Every functional requirement decomposes
   into at least one user story or use case unless flagged as
   infrastructure-only.
2. Capture non-functional requirements explicitly: performance, security,
   availability, accessibility, compliance, localization, data retention.
3. Define acceptance criteria for every user story using a testable form
   (Given/When/Then or equivalent).
4. Cross-check every SRS clause and user story against:
   - Its parent BRD section.
   - The glossary.
   - The module catalog (every story sits inside one module).
5. Tech lead or solution architect reviews for buildability; product owner
   confirms business intent is preserved.

**Exit Gate:**

- Every must-have BRD requirement is covered by at least one user story or
  SRS clause.
- Every story has acceptance criteria and a definition of ready.
- Tech lead has reviewed and either accepted or returned with blockers
  logged.

**Common Failure Modes:**

- Acceptance criteria that restate the requirement instead of testing it.
- Hidden non-functional requirements ("must be fast") with no measurable
  threshold.
- Stories whose acceptance contradicts the BRD.

## Phase 6 — Wireframes

**Goal:** Visualize each screen and surface, then reconcile it with the SRS
so the delivery team has one consistent source.

**Inputs:**

- SRS / PRD + user stories.
- Domain map and module catalog.
- Any existing design system or brand constraints.

**Activities:**

1. List every screen the system needs. For each screen, create a
   `docs/templates/wireframe-screen-spec.md` entry:
   - Screen ID and name.
   - Primary actor and module.
   - User stories served.
   - Fields, inputs, states, transitions, errors.
   - Cross-references to SRS clauses or use cases.
2. Sketch the wireframe (link to Figma, Balsamiq, image, or markdown
   diagram).
3. Run a continuous cross-check against the SRS:
   - Every story acceptance condition is reachable in the wireframe.
   - Every screen field corresponds to a data element described in the SRS
     or to an explicitly added new requirement.
   - Every error/empty state is described in SRS or added as a new
     requirement (which loops back to Phase 5 via change request).
3. Walk wireframes through stakeholders. Capture feedback as new requirement
   entries; do not silently revise screen specs.
4. UX/product review approves final set.

**Exit Gate:**

- Every user story has at least one screen specification (unless story is
  non-UI).
- Every screen specification cross-references at least one user story.
- Cross-check report exists in `docs/project/validation/` with no
  unreconciled divergences.

**Common Failure Modes:**

- Wireframes that introduce new fields silently (becomes invisible scope
  growth).
- Treating the wireframe as the final source of truth (it is not; SRS is).
- Skipping error and empty states.

## Re-Opening A Phase

A later phase may force a re-open. When that happens:

1. Log the trigger as a change request under
   `docs/project/validation/<date>-changeset.md`.
2. Update the upstream artifact (requirement, BRD, SRS, story).
3. Re-run the affected exit gate.
4. Update the traceability matrix.
5. Notify stakeholders whose sign-off the change affects.

Silent re-opens are the most common cause of late-engagement scope drift.
This harness treats them as a defect.
