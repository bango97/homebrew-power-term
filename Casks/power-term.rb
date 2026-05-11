cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.35"
  sha256 arm:   "427321bb4dc185fcfd72c30a392cd8962458381d159eb78749d61cfdfbef2372",
         intel: "98e7ace2052d106853ebd9a3deb7f30c6574d5da61027d01c552cc12a44740fc"

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
