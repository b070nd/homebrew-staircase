class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "1.0.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.0/staircase_1.0.0_darwin_arm64.tar.gz"
      sha256 "6ba888172bb74fb719052f08e56001df8d9bcc8f78da11a2e2375f23b25d8741"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.0/staircase_1.0.0_darwin_amd64.tar.gz"
      sha256 "b54d3a68677988c3b3f9b8b8521eb7def0b298d259b453d14b75489573fc5aa0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.0/staircase_1.0.0_linux_arm64.tar.gz"
      sha256 "4a1a7dccb3fad1d35db662b1e3efb0b4507d2d5a06b2d7bc771b44d95b29efc9"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.0/staircase_1.0.0_linux_amd64.tar.gz"
      sha256 "376d62f599f33a7cafd6fa4b08f8a5a3f62609d05f8dbe21183d84274c6db8ca"
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
