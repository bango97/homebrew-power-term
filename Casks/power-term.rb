cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.21"
  sha256 arm:   "af263729b0262da1d7df256df5f5decbd8daa1262563a801891574a61a7f3733",
         intel: "b28995e8f07e703bc1a56497737b8b627d9e479f3a7c9a2794e4e903c8d361c9"

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
