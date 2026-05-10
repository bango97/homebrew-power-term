cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.28"
  sha256 arm:   "0801ff5873c86d3878a02a5e647b24b9ebb2608b87870783a1a9103c7cb32827",
         intel: "e1b9571e22a258e788d88fdba4a5a6cf1e06ecaef1afcbc0bd85bbee051b632a"

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
