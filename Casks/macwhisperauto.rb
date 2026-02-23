cask "macwhisperauto" do
  version "0.0.18-de59a4d"
  sha256 "8ac388806806739ac09c45bc7eb5734f6364fc997d9931c9bc7e8a2b838049b2"

  url "https://github.com/chrisns/MacWhisperAuto/releases/download/v#{version}/MacWhisperAuto.app.zip"
  name "MacWhisperAuto"
  desc "Automatic meeting detection and MacWhisper recording"
  homepage "https://github.com/chrisns/MacWhisperAuto"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"

  app "MacWhisperAuto.app"

  postflight do
    system "open", "#{appdir}/MacWhisperAuto.app"
  end

  caveats <<~EOS
    MacWhisperAuto is ad-hoc signed and not notarized by Apple.
    On first launch, macOS Gatekeeper will block it. To allow it:

      System Settings > Privacy & Security > scroll to Security
      Click "Open Anyway" next to the MacWhisperAuto warning

    MacWhisperAuto requires MacWhisper to be installed separately:
      https://goodsnooze.gumroad.com/l/macwhisper

    You must grant Accessibility permission for recording automation:
      System Settings > Privacy & Security > Accessibility
  EOS

  zap trash: "~/Library/Logs/MacWhisperAuto"
end
