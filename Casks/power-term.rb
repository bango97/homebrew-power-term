cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.9"
  sha256 arm:   "347267aa87fa42daa944293fdef9b5b7378d2755ce0ac37a7e13ff048993214b",
         intel: "d57c41f5072617da02bc616be067b7e3f837be2b4307fd68f86ec85fa63b8d16"

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
