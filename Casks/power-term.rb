cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.40"
  sha256 arm:   "ade411ea3f21babad5c80fec42e2fb229e7bd19cb24aa844c25fdf55c585cffe",
         intel: "dd4266572dfc78d4525ce6cec426160546bad3b9c041a3b92ecde1b7001f1589"

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
