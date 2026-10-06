class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.11.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.11.0/staircase_0.11.0_darwin_arm64.tar.gz"
      sha256 "79bc91c39b60d82fe9fef72068eb1d949793bab6dcb9133245e7eebade36cd9f"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.11.0/staircase_0.11.0_darwin_amd64.tar.gz"
      sha256 "3c8f258819636d8f85545b2d15d9eae2ed98939bc85111feeddf34588f2c9759"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.11.0/staircase_0.11.0_linux_arm64.tar.gz"
      sha256 "f68ffedd72adf79b76c4ff4c0262d3c527b1b0e3e65d91e30cdeb86d603a8c00"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.11.0/staircase_0.11.0_linux_amd64.tar.gz"
      sha256 "72e25c328cf14ab34a513ff14010a981b43dd3d5e58f05d049e3202e48402317"
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
