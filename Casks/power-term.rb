cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.6"
  sha256 arm:   "a06341cc5a327f218bcc7f650089ad8cf4d6eb8e344cf55d252d3c40d462b386",
         intel: "7215ee4dd318bbb1b41630a85df1db292686f8765c79f10be0bcdd1db8259469"

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
