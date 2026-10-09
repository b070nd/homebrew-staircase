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
      sha256 "16f3fc448908cff81d8feab3d61fb452a958f8a42124d73f45341f07414dba3c"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.0/staircase_1.0.0_darwin_amd64.tar.gz"
      sha256 "8739dcb0c0495a0c19dd9e401ff4ac821863c95001ada4820e4b37c3d37f2f77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.0/staircase_1.0.0_linux_arm64.tar.gz"
      sha256 "f90f4e7dd05e1d0e010cf013886c31ee2e9a45c23153d767907a1f36b7ed8e9e"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.0/staircase_1.0.0_linux_amd64.tar.gz"
      sha256 "c1a756a365ae8e648e781e8afd6461cbbccf317288335ab38897ed3a21fd9c87"
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
