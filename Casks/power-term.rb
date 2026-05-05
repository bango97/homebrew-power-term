cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.15"
  sha256 arm:   "dd1fa98a1332576b673c54fb5f67059b127f3a7028592f83a40fffe259946140",
         intel: "9bbb51c7685187d8742a06ec3f1e75b0e2c38928e91b1a3a3a3e2098527368f8"

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
