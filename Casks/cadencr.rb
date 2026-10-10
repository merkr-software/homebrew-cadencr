cask "cadencr" do
  arch arm: "-arm64", intel: ""

  version "0.12.1"
  sha256 arm:   "f0d96f0f2a3e787b7c4d4eee714186ca4eecc88292ac9aef6044eeb8fb0b9233",
         intel: "7731b8666c3f8ab2004f057b36b83d3d91602281a585442f3f8a13c6f5202c87"

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
