cask "power-term" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.23"
  sha256 arm:   "c9e06437a12091556d7f4eb53e92cc47c1474a4e466ff15996ccead40608d1ab",
         intel: "1c9ee34c84779cfa141ce7b8c1eaf961229018138af31a5aaed375ec432e53f5"

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
