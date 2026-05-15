# Validation

Suggested layout:

```text
validation/
  <date>-crosscheck-<scope>.md   # filled from templates/validation-report.md
  <date>-walkthrough-<artifact>.md
  <date>-signoff-<artifact>.md   # sign-off evidence
  changesets/
    CR-<date>-<id>.md            # change requests
```

This folder is the analyst's audit trail. Sign-off evidence here is what
allows BRD and SRS to move to `signed-off` status.
