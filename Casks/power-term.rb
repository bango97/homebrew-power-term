cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.5"
  sha256 arm:   "5cf8ccdec887c9a3340073c3bd0ef6994e7272794d9d09dde9a7bbf502e84aa7",
         intel: "1b32e26bccf0f87346d5a6eb17193ef27e8925efdd3623303161d730281a3ffb"

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
