cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.39"
  sha256 arm:   "bd1d18005314e2ccd00550b752fbdcd0a809bcd221df5c2314de4ae2ae286645",
         intel: "0f9a6e061904ba92aada54ce24d6f89a39b565fc68f7ba77c422f4e526f89ae8"

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
