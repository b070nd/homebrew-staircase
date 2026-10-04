class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.7.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.0/staircase_0.7.0_darwin_arm64.tar.gz"
      sha256 "221c1457ee8bfdcccc0323092d4915f4e8d47a6e43c5e1d766b75da8dbff14c8"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.0/staircase_0.7.0_darwin_amd64.tar.gz"
      sha256 "d60bebe1ef49f111722c411a9a31581c8909884b6e1ea2d46dcfe2d22e4c2fdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.0/staircase_0.7.0_linux_arm64.tar.gz"
      sha256 "5d76a29f0aca4805cb42f0a3881ffdd8cd9230a0f572154ed82938d1eb95a51a"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.0/staircase_0.7.0_linux_amd64.tar.gz"
      sha256 "ffe163a4aa978bdc18fd83e8759126a228c4876e54ba8bad00bc844557ed6568"
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
