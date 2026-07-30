cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.5"
  sha256 arm:   "d3a6aedd1682f97080aa6e7c8cac3183533c1d248a533fa0bb242cfddef8462a",
         intel: "d34f22f435707d018e0e6b34a566a8db7f72179225120450cbdbfb347d5850a1"

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
