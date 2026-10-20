cask "gloss" do
  arch arm: "arm64", intel: "x64"

  version "0.20.0"
  sha256 arm:   "ac12f67de783d5b27b99de28c181a6826dffe17826413e5db7c72bd828a0d911",
         intel: "910ad4e480a3b395b6694b517f10c2da41b07be6730a8045cb910c981948705a"

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
