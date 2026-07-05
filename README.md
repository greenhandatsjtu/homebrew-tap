# greenhandatsjtu/tap

Homebrew tap for Codex Helm.

## Install

```bash
brew tap greenhandatsjtu/tap
brew trust --tap greenhandatsjtu/tap
brew install --cask codex-helm
xattr -cr "/Applications/Codex Helm.app"
```

## Update

```bash
brew upgrade --cask codex-helm && xattr -cr "/Applications/Codex Helm.app"
```

> `brew trust` is required by Homebrew 6.0+ for third-party taps.
> `xattr -cr` dismisses the macOS Gatekeeper warning (the app is unsigned).
> Only needed on first install or after each upgrade.
