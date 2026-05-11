cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.36"
  sha256 arm:   "ca37767da40ab290582ed9f0afdfea486e4e76370e2f53deccd310ddbf99d820",
         intel: "022e249f0bb67cededd58728daee01a94a53561820af1761b723b3331b3b705c"

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
