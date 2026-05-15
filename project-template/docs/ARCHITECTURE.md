# Information Architecture (BA Artifacts)

BA artifacts have no compiler. Their integrity comes from explicit linkage:
which artifact derives from which, and which downstream pieces depend on a
given upstream piece. This document defines the linkage rules.

## Artifact Layers

```text
raw notes (meeting, transcript, email, doc, chat, observation, survey)
  <- intake form (classified entry point for an engagement)
  <- elicitation sessions (structured logs)
      <- raw statements
          <- analyzed requirements
              <- glossary + context map + modules
                  <- BRD
                      <- SRS / PRD
                          <- epics
                              <- user stories
                                  <- wireframe screens
```

Each layer derives from and refines the one above. Raw notes sit at the
very bottom — they are the evidentiary floor. Every higher layer must be
traceable back to one or more notes.

## Dependency Rule

Upstream layers must not depend on downstream layers.

| Layer | May depend on | Must not depend on |
| --- | --- | --- |
| Raw note | nothing (it IS the source) | any structured artifact |
| Stakeholder intake | raw notes (source material) | sessions, requirements, BRD |
| Elicitation session | raw notes, intake, prior sessions, question bank | requirements catalog, BRD |
| Raw statement | one session OR one raw note directly | analyzed requirements, downstream artifacts |
| Analyzed requirement | one or more raw statements, glossary | BRD wording, SRS wording, stories |
| Glossary / context map / module | analyzed requirements | BRD, SRS, stories, wireframes |
| BRD section | analyzed requirements, glossary, modules | SRS clauses, stories, wireframes |
| SRS / PRD clause | BRD section, requirements, glossary, modules | stories' implementation details, wireframes |
| Epic / user story | SRS clause (or PRD outcome), BRD section, module | wireframe layout |
| Wireframe screen | story, SRS clause, module, glossary | nothing downstream |

A downstream finding that contradicts an upstream artifact must trigger a
change request, not a silent edit of the downstream.

## Identifier Scheme

Stable IDs are the spine of traceability. Use these prefixes:

| Prefix | Meaning | Example |
| --- | --- | --- |
| `MN-` | Meeting note (raw) | MN-2026-05-12-marketing-sync |
| `TR-` | Transcript (raw) | TR-2026-05-15-coordinator-interview |
| `EM-` | Email (raw) | EM-2026-05-13-cfo-budget |
| `DOC-` | Document excerpt (raw) | DOC-2026-05-14-current-process |
| `MSG-` | Chat message (raw) | MSG-2026-05-16-it-ops |
| `OBS-` | Observation (raw) | OBS-2026-05-17-warehouse |
| `SUR-` | Survey response (raw) | SUR-2026-05-20-pulse |
| `INT-` | Intake form | INT-2026-05-11-001 |
| `STK-` | Stakeholder | STK-007 |
| `SES-` | Elicitation session | SES-2026-05-12-CFO |
| `RAW-` | Raw statement (extracted) | RAW-118 |
| `REQ-` | Analyzed requirement | REQ-042 |
| `NFR-` | Non-functional requirement | NFR-009 |
| `CON-` | Constraint | CON-003 |
| `ASM-` | Assumption | ASM-014 |
| `MOD-` | Module | MOD-Onboarding |
| `BR-`  | BRD section | BR-5.2 |
| `SR-`  | SRS clause | SR-4.3.1 |
| `EPC-` | Epic | EPC-02 |
| `US-`  | User story | US-014 |
| `UC-`  | Use case | UC-021 |
| `SCR-` | Wireframe screen | SCR-Login |
| `DEC-` | Decision | DEC-0003 |
| `CR-`  | Change request | CR-2026-05-22-001 |

IDs are append-only. Retiring an ID does not free it for reuse.

## Status Vocabulary

A single artifact moves through:

```text
draft -> review -> agreed -> changed -> retired
```

| Status | Meaning |
| --- | --- |
| `draft` | Author owns it; not yet circulated |
| `review` | Circulated; awaiting feedback |
| `agreed` | Stakeholder(s) accepted; downstream may rely on it |
| `changed` | Was agreed, then changed via change request |
| `retired` | No longer part of current scope |

`agreed` and `signed-off` are different. Sign-off is reserved for BRD and
SRS at the document level, recorded in `docs/project/validation/` with date
and signing role.

## Linkage Rules

1. Every raw statement points to at least one raw note (MN/TR/EM/DOC/MSG/
   OBS/SUR) and at least one stakeholder. If captured through a formal
   session, it also points to one SES.
2. Every analyzed requirement points to at least one raw statement, which
   in turn points to its raw note source.
3. Every BRD section points to one or more requirements.
4. Every SRS clause points to one or more BRD sections (or, for purely
   technical NFRs, directly to an NFR requirement).
5. Every user story points to one or more SRS clauses (or PRD outcomes) and
   sits inside one module.
6. Every wireframe screen points to one or more user stories (or use cases)
   and one module.
7. Every change request points to the artifacts it changes and the
   stakeholders re-notified.

If any of these links is missing, the artifact is `draft` at best.

## Parse-First Rule (BA Variant)

Unknown statements must be parsed at the elicitation boundary before they
flow into the catalog. Boundaries include:

- Interview transcripts and notes.
- Workshop output (sticky notes, board photos, board exports).
- Document review excerpts.
- Survey responses.
- Customer emails and tickets.

Parsing path:

```text
raw transcript or document
  -> raw statement (verbatim or near-verbatim)
  -> classified statement (functional, NFR, constraint, assumption,
                          out-of-scope, glossary candidate, decision input)
  -> analyzed requirement, glossary entry, or parked item
```

The catalog must distinguish "what the stakeholder said" from "what the BA
inferred". Both are valuable; mixing them is a defect.

## Observability Contract

Each artifact file must include a metadata header capturing:

- ID.
- Status.
- Owner (BA name or role).
- Source links (upstream IDs).
- Last reviewed date.

Each significant artifact change should leave a one-line entry in the
artifact's `## History` section: date, who, what, why. This is the analyst's
equivalent of an audit log.

Validation cross-check reports under `docs/project/validation/` are the
analyst's equivalent of test reports. They are the durable evidence that an
artifact reached `agreed` or `signed-off`.
