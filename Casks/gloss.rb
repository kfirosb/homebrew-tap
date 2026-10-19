cask "gloss" do
  version "0.17.0"
  sha256 arm:   "354795054836a06c9816a72af6b3ab555e5bc7053c7496562acf0c5c487aa899",
         intel: "9b4beef6916a22b89ba5e4b4067a73742bdbf641186c53c3aaa7b81cd1cb2abc"

  arch arm: "arm64", intel: "x64"
  url "https://github.com/kfirosb/gloss/releases/download/v#{version}/Gloss-#{version}-#{arch}.dmg"
  name "Gloss"
  desc "Talk to Claude Code and Codex in Hebrew or any language from your terminal"
  homepage "https://github.com/kfirosb/gloss"

  livecheck do
    url :url
    strategy :github_latest
  end

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
