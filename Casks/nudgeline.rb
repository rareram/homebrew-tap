cask "nudgeline" do
  version "0.1.148"
  sha256 "8de1cef41a52140e08aa4fedf0eb0586a2f2c25a565e2c92b7d95af41a293563"

  url "https://github.com/rareram/NudgeLine/releases/download/v#{version}/NudgeLine.zip"
  name "NudgeLine"
  desc "Subtle macOS screen-edge timeline bar for today's calendar events"
  homepage "https://github.com/rareram/NudgeLine"

  depends_on macos: :sonoma

  app "NudgeLine.app"

  zap trash: [
    "~/Library/Application Support/NudgeLine",
    "~/Library/Preferences/com.rareram.NudgeLine.plist",
  ]
end
