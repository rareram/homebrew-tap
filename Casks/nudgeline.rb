cask "nudgeline" do
  version "0.1.138"
  sha256 "2a076d55576278a4c3aaadb83d24e226e9b6a3220957d319728688aa2d1caae3"

  url "https://github.com/rareram/NudgeLine/releases/download/v#{version}/NudgeLine.zip"
  name "NudgeLine"
  desc "Subtle macOS screen-edge timeline bar for today's calendar events"
  homepage "https://github.com/rareram/NudgeLine"

  depends_on macos: ">= :sonoma"

  app "NudgeLine.app"

  zap trash: [
    "~/Library/Application Support/NudgeLine",
    "~/Library/Preferences/com.rareram.NudgeLine.plist",
  ]
end
