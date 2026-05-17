cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "0e05ba6930f147bd6a1659030f23ce555328bc41c16ff8169fa85f18258d6caf",
         intel: "7d2ab263d5132a9d42dfaf42b16fd74b404e9a55c39c129078aea40929139bec"

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
