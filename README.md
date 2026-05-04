# homebrew-power-term

Homebrew tap for [power-term](https://github.com/Financial-Support/power-term) — a modern terminal built with Tauri.

## Install

```bash
brew tap bango97/power-term
brew install --cask power-term
```

## Notes

power-term is **not code-signed or notarized** by Apple. The cask runs `xattr -cr` as a postflight step to clear the quarantine attribute, so the app launches normally without manual intervention.

If you'd rather sidestep the tap and install manually, grab the DMG from [Releases](https://github.com/Financial-Support/power-term/releases) and run after dragging:

```bash
xattr -cr /Applications/power-term.app
```

## Updating

```bash
brew update
brew upgrade --cask power-term
```
