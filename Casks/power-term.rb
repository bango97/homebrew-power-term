cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.17"
  sha256 arm:   "f71011b838efc24dae4f4d2462696e812a1666fcd7198f666d7a53dc16de1e92",
         intel: "a92acc53a9fe9324aaebc0bd945728ba0ed5ef75584b0c6707fe1733e9b7ed30"

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
