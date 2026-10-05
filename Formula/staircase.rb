class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.9.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.9.0/staircase_0.9.0_darwin_arm64.tar.gz"
      sha256 "faea79029b7164dbb0ae96c72f64249933eea7ce5b16f8169155dcc0ff6cb004"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.9.0/staircase_0.9.0_darwin_amd64.tar.gz"
      sha256 "6196229148199d37c6971fd976d4b1d9c43b986c97e7f2fa31b6bf7135cbd046"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.9.0/staircase_0.9.0_linux_arm64.tar.gz"
      sha256 "0201fde6029f9dac539751751e2a2fcc7f2a7f7c3386c25d72410809d10bfc19"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.9.0/staircase_0.9.0_linux_amd64.tar.gz"
      sha256 "e157b5727b3a910403f01238e66b93bbae160a268b3d3144ee56c2df78c61159"
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
