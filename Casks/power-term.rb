cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.3"
  sha256 arm:   "7b58ec0efadf2b1b16862c6e9956ebbfbcfbe1ca9d1384a23229ceb5a169f270",
         intel: "b9c5deb96c9e000540e3a4fa8dc557eeb3f81d0d52617d3e167174709c8f32aa"

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
