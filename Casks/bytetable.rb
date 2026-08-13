# Homebrew Cask TEMPLATE. `0.0.32` and `6078ae94fc7d9c4c72cc0c7f54dc1ae67d08d643fc1954af55951e3b82f72aac` are substituted (from
# the git tag and the release's SHASUMS256.txt) by the `homebrew` job in
# .github/workflows/release.yml, which then commits the rendered cask to the
# tap repo (Rezwanul-Haque/homebrew-tap → `Casks/bytetable.rb`). For a manual
# render see README.md.
cask "bytetable" do
  version "0.0.32"
  sha256 "6078ae94fc7d9c4c72cc0c7f54dc1ae67d08d643fc1954af55951e3b82f72aac"

  url "https://github.com/Rezwanul-Haque/byteTable/releases/download/v#{version}/ByteTable_#{version}_universal.dmg",
      verified: "github.com/Rezwanul-Haque/byteTable/"
  name "ByteTable"
  desc "Fast, local-first desktop database client"
  homepage "https://github.com/Rezwanul-Haque/byteTable"

  # ByteTable updates itself via the in-app Tauri updater, so Homebrew shouldn't
  # try to manage upgrades.
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ByteTable.app"

  zap trash: [
    "~/Library/Application Support/com.bytetable.desktop",
    "~/Library/Caches/com.bytetable.desktop",
    "~/Library/Preferences/com.bytetable.desktop.plist",
    "~/Library/Saved Application State/com.bytetable.desktop.savedState",
    "~/Library/WebKit/com.bytetable.desktop",
  ]
end
