cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.6"
  sha256 arm:   "6c23cfb2d08b766a65db68e255ae6eb6b2bc45f233d90357cdf02e69d7c9cacf",
         intel: "290629f3ba29d11f023b6f2d080cca97676d806d0765b4d6e485a0d30b0f047e"

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
