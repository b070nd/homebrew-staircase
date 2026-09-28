class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.3.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.3.0/staircase_0.3.0_darwin_arm64.tar.gz"
      sha256 "dc06afbd4c3f278f248f61098d78f75baf50c1343a0145b5cf55afab7080d98a"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.3.0/staircase_0.3.0_darwin_amd64.tar.gz"
      sha256 "ceb89e78dae50daf3d04c710afe43be67391433b1a198bb6806aeaface256859"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.3.0/staircase_0.3.0_linux_arm64.tar.gz"
      sha256 "50efe049f743c7ddc6312f559a210c9cc4567fd9420f92f311887951333f7f72"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.3.0/staircase_0.3.0_linux_amd64.tar.gz"
      sha256 "635e5bf51f46f70612a71765efc5f1b9a360205c3b2c32c5c0f233f44476318a"
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
