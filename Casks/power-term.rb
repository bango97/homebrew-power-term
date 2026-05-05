cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.10"
  sha256 arm:   "9b8df99fbeb25574c19645f4c4f67445ee584b7914bef02be14dd0024b4c3be6",
         intel: "45c4676eb58bddaf260ab65b37d77265764b95ea1e395c31dbbdfd5fa45f40fb"

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
