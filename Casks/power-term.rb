cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.11"
  sha256 arm:   "c43337c42e68990dc01f420e8f08efe9b86e2451e95eebda5e3ce983b063d366",
         intel: "e2415d22d6e27cadb753f2176156c8adcc44e62b54b32948f70c189037195d90"

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
