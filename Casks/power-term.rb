cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.20"
  sha256 arm:   "35f414fcc88d37880560ba454fa41ebe489030bfc7374b28de112603b2500585",
         intel: "cc8d2cf56f385f6977fcbec682a4568b1e4e0c854cbf7ed221d4e22e2410ce96"

  url "https://github.com/bango97/homebrew-power-term/releases/download/v#{version}/PowerTerm-#{version}-#{arch}.dmg"
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
