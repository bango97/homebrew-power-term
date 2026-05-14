cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.38"
  sha256 arm:   "b7e3779e98a02307542f0c5d61ac91e72f23d44501d33fc8bb00c8ebacb3f862",
         intel: "205212835d8e9b823aedf98b3db7d53c55e8fc8422e280dd3d80c15968cfc1ae"

  url "https://github.com/bango97/homebrew-power-term/releases/download/v#{version}/Power.Term_#{version}_#{arch}.dmg"
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
