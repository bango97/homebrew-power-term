cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.3"
  sha256 arm:   "48d39216fa9ebfa9a0a7461066ad7bd4b2caf341c3787650f31a8cb4bdc8bd2d",
         intel: "1f5c4bd67c3887f3efbb9e93107abad8d4ceb7935fb82e08458fdb7c2c0a2938"

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
