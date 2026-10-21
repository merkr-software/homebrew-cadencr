cask "cadencr" do
  arch arm: "-arm64", intel: "-x64"

  version "0.14.1"
  sha256 arm:   "5f09490395a44cc5c4c58acb16c3b2be93d4495578c51533fe8da29a9c09b35a",
         intel: "531e58086340e919e21b8d798d007707f5d0d5c5aaeb0a514f409c686b00b034"

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
