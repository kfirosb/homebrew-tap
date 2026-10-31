cask "gloss" do
  arch arm: "arm64", intel: "x64"

  version "0.25.1"
  sha256 arm:   "0846d926265ebac31d3a84ce950966647085df7b451c77e080c344715e4c0533",
         intel: "352025d66cae51a259fb78689f3bef863378b7832a72b06618b87b67fbb0a729"

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
