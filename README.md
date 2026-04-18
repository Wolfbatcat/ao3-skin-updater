# AO3: Skin Updater

Automatically update timestamps on metadata sections on git commit.

In theory this should work on any file with `- Updated:`, not just site skins.

## Setup

### Windows
1. Drag `.skin-updater` folder into your project root
2. Run `setup-windows.bat` from inside the folder
3. Add this to your CSS: `- Updated:      0000-00-00 00:00 UTC` (any placeholder value works)

### Mac/Linux
1. Drag `.skin-updater` folder into your project root
2. Run `bash setup-mac-linux.sh` from inside the folder
3. Add this to your CSS: `- Updated:      0000-00-00 00:00 UTC` (any placeholder value works)

## Usage

Stage commits through the UI or:

```bash
git add your-skin.css
git commit -m "Your message"
```

Timestamp updates automatically. ✓

## Example

Before: `- Updated:      0000-00-00 00:00 UTC`
After:  `- Updated:      2026-04-18 15:45 UTC`

Templates for desktop, tablet, mobile, theme, and add-on metadata blocks are provided in the `templates` folder.

## Uninstall

Delete `.git/hooks/pre-commit` and the `.skin-updater` folder.