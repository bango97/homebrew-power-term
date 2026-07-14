cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.7"
  sha256 arm:   "5c5bdea2c4c5a35a126d716e151f5f7e31047ccc94964650088dd4a0e1eefa32",
         intel: "4fe95fb8e5390f1ded479a5b9744c11468f4207bbb933abf10045f9cfe4788ce"

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
