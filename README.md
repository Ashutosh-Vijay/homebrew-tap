# Homebrew tap

Mac installs for [DataWeave Studio](https://github.com/Ashutosh-Vijay/DataWeave-Studio).

```bash
brew trust ashutosh-vijay/tap
brew install --cask ashutosh-vijay/tap/dataweave-studio
```

Homebrew 6 and later ask you to trust a third-party tap before using it. That is the first line.

The app is not notarized by Apple, so the cask clears the quarantine flag after installing. If your Mac is managed and that is not allowed, use the [VS Code extension](https://marketplace.visualstudio.com/items?itemName=ashutosh-vijay.dataweave-studio) instead.

This tap is updated automatically on every release.
