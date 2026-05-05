cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.7"
  sha256 arm:   "a2d38f93aa8de6e578675b69ee762e4e5e27c12b1395a0bfe1957515c7668987",
         intel: "3e0784164728fada8b1f6d0fff587e256c06618ec760661f21b596acf66670d4"

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
