cask "nudgeline" do
  version "0.1.170"
  sha256 "5fee590a8ca827caedf5b7c6aa6a78d6a0b17bb16a5f2ce5eb6de20fd728f0e3"

  url "https://github.com/rareram/NudgeLine/releases/download/v#{version}/NudgeLine.zip"
  name "NudgeLine"
  desc "Subtle macOS screen-edge timeline bar for today's calendar events"
  homepage "https://github.com/rareram/NudgeLine"

  depends_on macos: :sonoma

  preflight do
    # 1. 업그레이드 전 실행 중인 구버전 NudgeLine 안전 종료
    system_command "/usr/bin/pkill",
                   args: ["-x", "NudgeLine"],
                   must_succeed: false,
                   sudo: false
  end

  app "NudgeLine.app"

  postflight do
    # Gatekeeper 격리 플래그 해제 (휴지통으로 이동 경고 원천 차단)
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/NudgeLine.app"],
                   sudo: false

    # 2. 업그레이드/설치 완료 즉시 신버전 NudgeLine 자동 실행
    system_command "/usr/bin/open",
                   args: ["#{appdir}/NudgeLine.app"],
                   must_succeed: false,
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
