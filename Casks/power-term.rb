cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.18"
  sha256 arm:   "37fcfeb5150e7ff9214a0e441cd932cad1201d0a88b4c896175516f23af0a7c7",
         intel: "898f309c18567c354d10863107059c8899a2642eea967a9a45088a2f0459abed"

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
