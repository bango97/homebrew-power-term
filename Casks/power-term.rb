cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "7df441153948585b3b503fbae2253e80dab76fa3969d519bb333c147fa34b209",
         intel: "4fe95fb8e5390f1ded479a5b9744c11468f4207bbb933abf10045f9cfe4788ce"

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
