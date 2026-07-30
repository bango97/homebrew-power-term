cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.4"
  sha256 arm:   "e13f30e92a130457291d6b4d51e2f47dfbdc5f24e00a63d4a290bef5da03c7d0",
         intel: "dbeba5b461f90971744583e654251722ccc4fc458cad2f1b0adad6186da540cb"

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
