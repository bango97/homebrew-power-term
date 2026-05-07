cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.22"
  sha256 arm:   "81f7870e1f256d1f8480714600fad9b5adeba995c10675250ac62f11a5c9111b",
         intel: "f9ab08298360c934cc308845e8c8ff967506bf7968af83e310e9dbd07ceda308"

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
