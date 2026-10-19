cask "gloss" do
  version "0.16.2"
  sha256 "f06d22075b48aeabcb75f9ddab9bc280b319e6e61179392d820e794720e5dd13"

  url "https://github.com/kfirosb/gloss/releases/download/v#{version}/Gloss-#{version}-arm64.dmg"
  name "Gloss"
  desc "Talk to Claude Code and Codex in Hebrew or any language from your terminal"
  homepage "https://github.com/kfirosb/gloss"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Gloss.app"

  zap trash: [
    "~/.language-assistant",
    "~/Library/Application Support/language-assistant",
    "~/Library/Preferences/local.language-assistant.plist",
    "~/Library/Saved Application State/local.language-assistant.savedState",
  ]

  caveats <<~EOS
    Gloss is ad-hoc signed and not notarized. On first launch macOS says it
    cannot verify the app: choose Done, then System Settings > Privacy &
    Security > Open Anyway. Gloss needs Codex or Claude Code signed in, and
    ripgrep (brew install ripgrep) for file search.
  EOS
end
