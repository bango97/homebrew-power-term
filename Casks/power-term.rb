cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.16"
  sha256 arm:   "6aa029e4f5548a40a0988434985b0873e6a75ed17845e97bbaf9f1066819604c",
         intel: "043c4f39a1f7059a9cd2aa3b0a55edfbeb99a48e49bd0cd7e7b67f3579e2c1ed"

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
