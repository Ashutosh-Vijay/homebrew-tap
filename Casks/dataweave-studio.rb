cask "dataweave-studio" do
  arch arm: "aarch64", intel: "x64"

  version "3.7.1"
  sha256 arm:   "385bfff78209eed4086c45ed5ab0c127608edc3b1d4db1ca4244765fbf33d6ff",
         intel: "e21f25264a68776f21b0b0b7100f72e6cf44cca438e29c25e8f812d51903517c"

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
