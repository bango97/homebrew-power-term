cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.19"
  sha256 arm:   "a4a0db8e2561bbea6865a4d3567bc9b9e2c4b461c7195c359c73d22ad293df0a",
         intel: "01926050cf8f3470f97a44a6c98fe2e86c95d343c00c34ae6043a55913ed8313"

  url "https://github.com/bango97/homebrew-power-term/releases/download/v#{version}/PowerTerm-#{version}-#{arch}.dmg"
  name "Power Term"
  desc "Modern terminal built with Tauri, React, and xterm.js"
  homepage "https://github.com/Financial-Support/power-term"

  app "Power Term.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Power Term.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.band.power-term",
    "~/Library/Caches/com.band.power-term",
    "~/Library/Preferences/com.band.power-term.plist",
    "~/Library/Saved Application State/com.band.power-term.savedState",
  ]
end
