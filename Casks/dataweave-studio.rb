cask "dataweave-studio" do
  arch arm: "aarch64", intel: "x64"

  version "3.7.0"
  sha256 arm:   "d586d5647302a3739600d68a0b5767b4ef292e7799f2d7b113cd03a19a930e21",
         intel: "e2e2b76d4c255238eabf7105d59627469782c6a9b3686b188af110f2d3c6fb15"

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
