# ao3-tools

A collection of scripts and reference notes for building AO3 site skins and JavaScript userscripts.

## AO3 Reference Guide

Distilled notes from AO3's official front-end documentation live in `_scripts/ao3-guide/`.

### When writing CSS site skins, read:

- [`_scripts/ao3-guide/css-rules.md`](_scripts/ao3-guide/css-rules.md) — formatting conventions, em units, allowed properties, the `#main` em scale
- [`_scripts/ao3-guide/class-system.md`](_scripts/ao3-guide/class-system.md) — how AO3 classes are named, combined, and inherited; full class hierarchy
- [`_scripts/ao3-guide/stylesheet-cascade.md`](_scripts/ao3-guide/stylesheet-cascade.md) — cascade order, where user skins slot in, page view types, page-specific Rails classes
- [`_scripts/ao3-guide/brand-tokens.md`](_scripts/ao3-guide/brand-tokens.md) — AO3's default colors and fonts (**reference only — not constraints**)
- [`_scripts/ao3-guide/icons-sprites.md`](_scripts/ao3-guide/icons-sprites.md) — icon sprite coordinates, required-tags layout, and icon size variants *(read when working with icons or required-tags)*

### When writing JavaScript userscripts, read:

- [`_scripts/ao3-guide/dom-patterns.md`](_scripts/ao3-guide/dom-patterns.md) — HTML structure and key selectors for all major AO3 patterns (blurbs, meta, stats, comments, regions, etc.)
- [`_scripts/ao3-guide/class-system.md`](_scripts/ao3-guide/class-system.md) — class names and modifier patterns for reliable DOM targeting
- [`_scripts/ao3-guide/js-patterns.md`](_scripts/ao3-guide/js-patterns.md) — JS-managed state classes, dropdown/filter/modal hooks, widget classes, and userscript patterns

### Notes on color and visual design

The user (skin maker) sets their own color palette and font choices. Do not enforce or default to AO3's brand colors. `brand-tokens.md` documents what AO3 ships with so you can reference or deliberately override specific values — nothing more.

## Scripts

- [`_scripts/copy-ao3-guide.bat`](_scripts/copy-ao3-guide.bat) — copies `_scripts/ao3-guide/` into a target repo's `docs/ao3/` folder
