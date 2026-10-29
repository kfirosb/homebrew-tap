cask "gloss" do
  arch arm: "arm64", intel: "x64"

  version "0.23.2"
  sha256 arm:   "e1a29d45473544a704502d55660bae1de688bf271f1fd14982b378964dedb4bb",
         intel: "a0877072a73889283f50d938b2183fc431fefb34c24f4506edd6acc12e398b49"

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
