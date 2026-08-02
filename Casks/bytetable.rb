# Homebrew Cask TEMPLATE. `0.0.27` and `fb685da78846449d38da9c3f842d7c4f4d97c43c68dc4ca1899ee3f5b4828917` are substituted (from
# the git tag and the release's SHASUMS256.txt) by the `homebrew` job in
# .github/workflows/release.yml, which then commits the rendered cask to the
# tap repo (Rezwanul-Haque/homebrew-tap → `Casks/bytetable.rb`). For a manual
# render see README.md.
cask "bytetable" do
  version "0.0.27"
  sha256 "fb685da78846449d38da9c3f842d7c4f4d97c43c68dc4ca1899ee3f5b4828917"

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
