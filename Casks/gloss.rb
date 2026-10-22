cask "gloss" do
  arch arm: "arm64", intel: "x64"

  version "0.22.0"
  sha256 arm:   "54a06b94cbc53cd1fb924739ecb62dcd8c6fa34011262e5f6afac8c397e39c8b",
         intel: "9808f1d9f75714a61123caef8ce7676d6e1ad1219c9791a864e68c2f0d3ae81e"

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
