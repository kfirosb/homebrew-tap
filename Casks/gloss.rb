cask "gloss" do
  arch arm: "arm64", intel: "x64"

  version "0.24.0"
  sha256 arm:   "e817465f16d447823c25fa5979ff702bdd5a0c253af873d04a818213594bbd87",
         intel: "46332414bb8b6587db8deed2fd90e72cd2ca3aac9c70bbd1aef7c842a0dc9279"

  url "https://github.com/kfirosb/gloss/releases/download/v#{version}/Gloss-#{version}-#{arch}.dmg"
  name "Gloss"
  desc "Translate Claude Code and Codex conversations into your language"
  homepage "https://github.com/kfirosb/gloss"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Gloss.app"

  zap trash: [
    "~/.gloss",
    "~/Library/Application Support/Gloss",
    "~/.language-assistant",
    "~/Library/Application Support/language-assistant",
    "~/Library/Preferences/io.github.kfirosb.gloss.plist",
    "~/Library/Saved Application State/io.github.kfirosb.gloss.savedState",
  ]

  caveats <<~EOS
    Gloss needs Codex or Claude Code signed in, and ripgrep
    (brew install ripgrep) for file search.
  EOS
end
