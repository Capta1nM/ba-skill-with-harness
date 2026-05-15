# Software Requirements Specification

Save as `docs/srs/srs.md`.

The SRS shape is system-led: it specifies functional and non-functional
behavior at clause-level granularity, suitable for handoff to a delivery
team in regulated or fixed-scope engagements. If the engagement is
product-led with continuous iteration, prefer `docs/templates/prd.md`.

## Metadata

- Project name:
- Version:
- Owner (BA):
- Status: draft | review | agreed | signed-off | changed
- Sign-off date / scope:

## 1. Introduction

### 1.1 Purpose

What this document specifies and who it is for.

### 1.2 Scope

What system is covered, what its boundaries are, what it does and does not
do. Reference BRD section 5.

### 1.3 Definitions, Acronyms, Abbreviations

Reference `docs/domain/glossary.md`. Only list SRS-local terms here.

### 1.4 References

External documents this SRS depends on (regulations, standards, parent BRD,
ADRs).

### 1.5 Overview

How the rest of the document is organized.

## 2. Overall Description

### 2.1 Product Perspective

How the system fits in the wider environment (link to context map).

### 2.2 Product Functions (summary)

A bulleted list; details in section 4.

### 2.3 User Classes & Characteristics

| User class | Description | Frequency | Privilege |
| --- | --- | --- | --- |

### 2.4 Operating Environment

Hardware, OS, browser, mobile, dependent systems.

### 2.5 Design & Implementation Constraints

| ID | Constraint | Source |
| --- | --- | --- |

### 2.6 Assumptions & Dependencies

| ID | Assumption / Dependency | Impact if false |
| --- | --- | --- |

## 3. External Interface Requirements

### 3.1 User Interfaces

Cross-reference wireframes under `docs/wireframes/`.

### 3.2 Hardware Interfaces

### 3.3 Software Interfaces

| ID | System | Direction | Data | Protocol | Frequency |
| --- | --- | --- | --- | --- | --- |
| INT-01 |  |  |  |  |  |

### 3.4 Communication Interfaces

## 4. Functional Requirements

Group by module. Each clause has a stable ID `SR-X.Y.Z`.

### 4.1 Module: MOD-XXX

#### SR-4.1.1 <Name>

- Trace: BR-X.X, REQ-XXX.
- Description:
- Inputs:
- Processing rules:
- Outputs:
- Error handling:
- Acceptance:
  - Given ..., when ..., then ...

(Repeat for every functional requirement.)

## 5. Non-Functional Requirements

### 5.1 Performance

| ID | Requirement | Threshold | Measurement |
| --- | --- | --- | --- |

### 5.2 Availability

### 5.3 Security

### 5.4 Accessibility

### 5.5 Compliance & Privacy

### 5.6 Maintainability & Supportability

### 5.7 Internationalization & Localization

### 5.8 Data Retention & Archival

### 5.9 Auditability

## 6. Data Requirements

### 6.1 Data Entities

| Entity | Purpose | Key attributes | Source / owner | Retention |
| --- | --- | --- | --- | --- |

### 6.2 Data Migration

If existing data must be carried in, describe what and how.

### 6.3 Reporting & Analytics

## 7. Use Cases

Reference use case files under `docs/stories/.../UC-*.md` or
inline the headline use cases here.

## 8. Open Issues

| ID | Issue | Owner | Target resolution |
| --- | --- | --- | --- |

## Sign-Off

Recorded in `docs/validation/<date>-signoff-srs.md`.

## History

- YYYY-MM-DD: created.
