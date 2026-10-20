cask "gloss" do
  version "0.19.0"
  sha256 arm:   "f11db66a8da0b65a5a7781ed1e5fa7588eea0aca1048565202ff1b3b05f55c10",
         intel: "7718c0b6ec7e826035aa6c179e7731ec78583f18fa538b84fd8ed6c73c573e34"

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
    "~/Library/Preferences/io.github.kfirosb.gloss.plist",
    "~/Library/Saved Application State/io.github.kfirosb.gloss.savedState",
  ]

  caveats <<~EOS
    Gloss needs Codex or Claude Code signed in, and ripgrep
    (brew install ripgrep) for file search.
  EOS
end
