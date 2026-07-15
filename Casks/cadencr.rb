cask "cadencr" do
  arch arm: "-arm64", intel: ""

  version "0.7.1"
  sha256 arm:   "0d8dfacee01c53244256ad63943207e107a6d07e5a0dd216f45b3433f37175fd",
         intel: "424b5afa3effedbe777b0ad425b97ddcc8b11ed92a4f2020429d5c6db629e4be"

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
