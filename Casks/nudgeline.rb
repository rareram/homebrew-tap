cask "nudgeline" do
  version "0.1.150"
  sha256 "d80d1965e7c9fa600fc0aadb47b4746e0145582086b1d636047bff3de2e93cec"

  url "https://github.com/rareram/NudgeLine/releases/download/v#{version}/NudgeLine.zip"
  name "NudgeLine"
  desc "Subtle macOS screen-edge timeline bar for today's calendar events"
  homepage "https://github.com/rareram/NudgeLine"

  depends_on macos: :sonoma

  app "NudgeLine.app"

  postflight do
    # Gatekeeper 격리 플래그 해제 (휴지통으로 이동 경고 원천 차단)
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/NudgeLine.app"],
                   sudo: false

    # [Reserved] 런치패드 즉시 강제 인덱싱이 필요할 경우 활성화:
    # system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
    #                args: ["-f", "#{appdir}/NudgeLine.app"],
    #                sudo: false
  end

  zap trash: [
    "~/Library/Application Support/NudgeLine",
    "~/Library/Preferences/com.rareram.NudgeLine.plist",
  ]
end
