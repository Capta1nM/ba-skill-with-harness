# Wireframes

Suggested layout:

```text
wireframes/
  index.md                       # list of all screens with status
  screens/
    SCR-<name>.md                # filled from templates/wireframe-screen-spec.md
  assets/                        # exported images, links, Figma references
```

Each screen spec must cross-reference the user stories and SRS clauses it
serves. Cross-check reports live in `../validation/`, not inside the screen
spec.
