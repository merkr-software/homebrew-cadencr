cask "cadencr" do
  arch arm: "-arm64", intel: ""

  version "0.13.0"
  sha256 arm:   "7c9adc364c0627eb92ec616c6d222e958cb8d6c040661dde6ad59ffa6bcdf4bb",
         intel: "087b11ec61c08e70f66c09b039ae51fcf430de0d4fa32264686f1e24d2c527e4"

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
