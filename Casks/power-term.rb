cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.13"
  sha256 arm:   "fa8b0cc27e5bc0b08d5a8c2e486cce3f25c97dcf434db00fe4cd0e11af8ab35f",
         intel: "2ccaf9c35edaaaa21eb41e1add7f7bb58ca24f5bcefc4ea41d5a91deb6772f65"

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
