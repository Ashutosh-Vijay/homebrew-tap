cask "dataweave-studio" do
  arch arm: "aarch64", intel: "x64"

  version "3.6.1"
  sha256 arm:   "4ce838d98fe28298274ce931797be17d2e13b5d351f95d60b5f51242c9841bb7",
         intel: "126d47715b27c330938d4dae12512e9b271036b1b1eacae6c4108da328c34b7e"

  url "https://github.com/Ashutosh-Vijay/DataWeave-Studio/releases/download/v#{version}/DataWeave.Studio_#{version}_#{arch}.dmg"
  name "DataWeave Studio"
  desc "Write, run and debug DataWeave scripts offline"
  homepage "https://github.com/Ashutosh-Vijay/DataWeave-Studio"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "DataWeave Studio.app"

  # The app is ad-hoc signed, not notarized (no Apple Developer account), so
  # macOS would call the quarantined download "damaged". Clear the flag.
  postflight_steps do
    run "xattr", args: ["-cr", "{{appdir}}/DataWeave Studio.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.dwstudio.desktop",
    "~/Library/Caches/com.dwstudio.desktop",
    "~/Library/Preferences/com.dwstudio.desktop.plist",
    "~/Library/Saved Application State/com.dwstudio.desktop.savedState",
    "~/Library/WebKit/com.dwstudio.desktop",
  ]
end
