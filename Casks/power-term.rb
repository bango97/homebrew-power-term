cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.12"
  sha256 arm:   "78c1bd2d9200c73be87a94fd6e256e19a7993c5bd31900fa184aa8250de1161f",
         intel: "7936b91458b53cc347f832d6439c459598c8d73f52178ddbd3ab20c14ba7844e"

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
