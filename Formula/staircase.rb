class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.8.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.8.0/staircase_0.8.0_darwin_arm64.tar.gz"
      sha256 "30d02dd39d6b37cc0d6861042a2d9ec47e51a0313205ede5ded056b5eb85bcbf"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.8.0/staircase_0.8.0_darwin_amd64.tar.gz"
      sha256 "c2694e4ca5b682d315f0033ae24b798086616948b46c5bfa661a4c89d9275e1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.8.0/staircase_0.8.0_linux_arm64.tar.gz"
      sha256 "4b98abfa6c1056652c202b5679606cbc57380820f6ff9437f5ff16f30d7081c0"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.8.0/staircase_0.8.0_linux_amd64.tar.gz"
      sha256 "347b91b2cecb5954f9c81cc21588de46d2f88779619d7771d0d269a18ba96e65"
    end
  end

  def install
    bin.install "staircase"
    bash_completion.install "completions/staircase.bash" => "staircase"
    zsh_completion.install "completions/staircase.zsh" => "_staircase"
    fish_completion.install "completions/staircase.fish"
  end

  test do
    assert_match "stAirCase v#{version}", shell_output("#{bin}/staircase version")
    ENV["STAIRCASE_DIR"] = testpath/"ws"
    system bin/"staircase", "init"
    system bin/"staircase", "doctor"
  end
end
