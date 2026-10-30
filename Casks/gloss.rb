cask "gloss" do
  arch arm: "arm64", intel: "x64"

  version "0.25.0"
  sha256 arm:   "80035890820a1449b93f40df24a880d7c4d849ce1bbcc641626c67ad7af2e389",
         intel: "557dc2edf49b294d131588f973bd31f8c4772d4c0b7c4da09b5c19bd8730351f"

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
