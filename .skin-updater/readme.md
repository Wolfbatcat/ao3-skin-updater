# AO3 Skin Updater

Automatically update AO3 skin timestamps on git commit.

## Setup

### Windows
1. Drag `.skin-updater` folder into your project root
2. Run `setup-windows.bat` from inside the folder
3. Add this to your CSS: `- Updated:      2026-04-18 14:32 UTC`

### Mac/Linux
1. Drag `.skin-updater` folder into your project root
2. Run `bash setup-mac-linux.sh` from inside the folder
3. Add this to your CSS: `- Updated:      2026-04-18 14:32 UTC`

## Usage

```bash
git add your-skin.css
git commit -m "Your message"
```

Timestamp updates automatically. ✓

## Example

Before: `- Updated:      2026-04-18 14:32 UTC`
After:  `- Updated:      2026-04-18 15:45 UTC`

## Uninstall

Delete `.git/hooks/pre-commit` and the `.skin-updater` folder.