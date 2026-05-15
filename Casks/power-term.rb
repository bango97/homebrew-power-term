cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.41"
  sha256 arm:   "b2d2d2a24b1309b1b206e8f0fbb04d0b8187a81fa2792559bcd6e2d983f3774d",
         intel: "81777dd589400c6fbd099bafe8127f8324d19b2e3e43c6fb12d692779f5f53ef"

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
