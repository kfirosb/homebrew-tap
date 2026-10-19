cask "gloss" do
  version "0.18.0"
  sha256 arm:   "fd38dd154bc3f68c288cce4afc38a291570aa18b0c40d3f02684fa516514472c",
         intel: "3bc6fb9139530ed1b4a7e364380823b526d4342dcc0f339d6490cbb413bdd9b3"

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
