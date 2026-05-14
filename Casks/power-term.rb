cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.37"
  sha256 arm:   "c25bfd9780f8ba03d47645478c30925e5aa232f4368f8084eb1999e5abf6bf6e",
         intel: "a2f4877e804110296e0468c2cafa22cbcada7af0542a03758e90b6c7ce52a62d"

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
