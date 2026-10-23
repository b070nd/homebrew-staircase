class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  license "MIT"
  version_scheme 1 # orders the Go releases after the earlier Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.3.0/staircase_1.3.0_darwin_arm64.tar.gz"
      sha256 "b48fea3d19196cf8f51f42c2096f858ecddd06404c5641bf072d9eeace46b155"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.3.0/staircase_1.3.0_darwin_amd64.tar.gz"
      sha256 "baa8c6093e86375e7bdd55b6dc54751674be66b802832fd521852885a03f9d65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.3.0/staircase_1.3.0_linux_arm64.tar.gz"
      sha256 "4e81492fa45043ace76b79dfc3c08e59b526c6c498bb707b2d3b70319a374595"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.3.0/staircase_1.3.0_linux_amd64.tar.gz"
      sha256 "a85b69c8e8607a5db97b437536a8281fbcd44f8b2ea68fbb046d1df4b4f0107c"
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
