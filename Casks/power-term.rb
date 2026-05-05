cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.14"
  sha256 arm:   "74a9e9dfda708d5e3eebb80b05f1c0adf3ef7f0539460274393002d35ae8ac19",
         intel: "dbb4741f2dd982df2468371b8a3baf7855fb62b522ba5648422956c5bd4a5d14"

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
