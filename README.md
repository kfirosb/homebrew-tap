# Homebrew tap for Gloss

[Gloss](https://github.com/kfirosb/gloss) is a local macOS app that translates your Codex and Claude Code terminal sessions into Hebrew or any other language.

```sh
brew install --cask kfirosb/tap/gloss
```

Requires Apple Silicon and macOS 13 or newer. The app is ad-hoc signed and not notarized: on first launch choose *Done* in the Gatekeeper dialog, then *System Settings > Privacy & Security > Open Anyway*.

Upgrade with `brew upgrade --cask gloss`. `brew uninstall --cask gloss` removes the app only; `brew uninstall --zap --cask gloss` also deletes your saved conversations under `~/.language-assistant`.

The cask is generated from the Gloss repository with `node scripts/homebrew-cask.mjs` on each release.
