cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.8"
  sha256 arm:   "1b892deed676dc41f34828f5d3dc8d0a18d8abacb588146cbbdac17382e10473",
         intel: "77a44c53e4f53252d704a3244e828116f15a6f4ba458b18b81d8ed9adc30b343"

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
