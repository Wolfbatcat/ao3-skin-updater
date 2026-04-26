# AO3 Guide Agent Routing

## Rule Type Legend
Type: REFERENCE

- **HARD RULE**: enforced by AO3 sanitizer, parser, runtime, or config. Violating this can strip CSS, break behavior, or hit a real AO3 limit.
- **BASELINE**: current AO3 default style, DOM, class, or behavior. Useful to match or override, but not a requirement.
- **RECOMMENDATION**: safer authoring or userscript practice. Valid alternatives may exist.
- **REFERENCE**: lookup data such as tokens, sprite coordinates, constants, selectors, or routing notes.


Use this file first. Read only the docs needed for the task, then follow each section's `Type:` label.

## Before Planning
Type: RECOMMENDATION + REFERENCE

- Identify project type: site skin, work skin, userscript, or mixed.
- Read the relevant docs below before proposing selectors, CSS properties, JS hooks, z-index values, or AO3 constants.
- Treat `HARD RULE` sections as constraints and `BASELINE` sections as defaults/reference points.

## Site Skin Tasks
Type: RECOMMENDATION + REFERENCE

Read:
- `css-rules.md` for sanitizer rules, parser quirks, em scale, and CSS caveats.
- `class-system.md` for valid AO3 class vocabulary.
- `stylesheet-cascade.md` for cascade position, breakpoints, and z-index.
- `brand-tokens.md` only when matching or intentionally overriding AO3 defaults.
- `icons-sprites.md` when changing required-tags or sprite-based icons.

## Work Skin Tasks
Type: RECOMMENDATION + REFERENCE

Read:
- `css-rules.md` for sanitizer rules and work-skin CSS limits.
- `work-skin-classes.md` for built-in AO3 utility classes.
- `dom-patterns.md` for `#workskin`, `.userstuff`, preface, notes, and work content structure.
- `brand-tokens.md` only as optional AO3 visual reference.

## Userscript Tasks
Type: RECOMMENDATION + REFERENCE

Read:
- `dom-patterns.md` before choosing selectors or parsing AO3 pages.
- `js-patterns.md` before detecting AO3 JS-managed state.
- `class-system.md` for class vocabulary and page/state classes.
- `js-api.md` before using modals, Rails AJAX events, CSRF timing, or AO3 globals.
- `stylesheet-cascade.md` before injecting overlays or fixed UI.
- `icons-sprites.md` when reading or replacing icon state.

## Debugging Checklist
Type: RECOMMENDATION + REFERENCE

- CSS missing: check `css-rules.md` HARD RULE sections first.
- CSS loses declarations: check parser quirks, especially duplicate properties and `font` shorthand.
- Selector returns nothing: check `dom-patterns.md` and `class-system.md`; many plausible class names do not exist.
- UI appears behind AO3 elements: check `stylesheet-cascade.md` z-index table.
- Userscript state detection flaky: prefer `js-patterns.md` reliable hooks and `js-api.md` runtime APIs.

## Manifest
Type: REFERENCE

Machine-readable routing metadata is in `ao3-guide.json`.



