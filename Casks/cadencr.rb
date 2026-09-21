cask "cadencr" do
  arch arm: "-arm64", intel: ""

  version "0.12.0"
  sha256 arm:   "2bb807bc9115091d697b78d1b989366e2e2920e4b5c64ba7cab9ba59a7354bab",
         intel: "3936d7aa6ceebc4f4b04349c8a98e3983987a297374bf08485b7996695940e9c"

  url "https://github.com/merkr-software/cadencr/releases/download/v#{version}/Cadencr-#{version}#{arch}.dmg",
      verified: "github.com/merkr-software/cadencr/"
  name "Cadencr"
  desc "Desktop IDE wrapping multiple AI coding agents"
  homepage "https://github.com/merkr-software/cadencr"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Cadencr ships its own electron-updater, so Homebrew must not flag the app
  # as outdated when it updates itself in place.
  auto_updates true
  depends_on macos: :big_sur

  app "Cadencr.app"

  zap trash: [
    "~/Library/Application Support/Cadencr",
    "~/Library/Caches/com.cadencr.desktop",
    "~/Library/Caches/com.cadencr.desktop.ShipIt",
    "~/Library/HTTPStorages/com.cadencr.desktop",
    "~/Library/Logs/Cadencr",
    "~/Library/Preferences/com.cadencr.desktop.plist",
    "~/Library/Saved Application State/com.cadencr.desktop.savedState",
  ]
end
