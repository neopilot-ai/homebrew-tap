class GitWtr < Formula
  desc "Git worktree manager with editor and AI tool integration"
  homepage "https://github.com/neopilot-ai/wtr"
  url "https://github.com/neopilot-ai/wtr/archive/refs/tags/v2.11.2.tar.gz"
  sha256 "21505ad2541d5be6135ed84fc33697146cf75b8e"
  license "Apache-2.0"

  depends_on "git"

  def install
    bin.install "bin/git-wtr"
    bin.install "bin/wtr"
    prefix.install "lib"
    prefix.install "adapters"

    # Install completions natively
    bash_completion.install "completions/wtr.bash" => "git-wtr"
    zsh_completion.install "completions/_git-wtr"
    fish_completion.install "completions/git-wtr.fish"
  end

  test do
    assert_match "wtr version", shell_output("#{bin}/git-wtr version")
  end
end
