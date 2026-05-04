cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "5df8a8d983942affe3e9cee5e603af79663be014844cc7a3a94dcd28e5fe4cb2",
         intel: "0df45ce58d29469f9ac5a183f47c478028cce457cea7d020f8fdc96901dda6b3"

  url "https://github.com/bango97/homebrew-power-term/releases/download/v#{version}/PowerTerm-#{version}-#{arch}.dmg"
  name "Power Term"
  desc "Modern terminal built with Tauri, React, and xterm.js"
  homepage "https://github.com/Financial-Support/power-term"

  app "Power Term.app", target: "power-term.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/power-term.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.band.power-term",
    "~/Library/Caches/com.band.power-term",
    "~/Library/Preferences/com.band.power-term.plist",
    "~/Library/Saved Application State/com.band.power-term.savedState",
  ]
end
