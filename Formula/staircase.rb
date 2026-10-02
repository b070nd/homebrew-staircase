class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.6.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.6.0/staircase_0.6.0_darwin_arm64.tar.gz"
      sha256 "31be4cf054b70182b0a831b0341b1d3c9776caaab78ca6b2565c2320e91b0e95"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.6.0/staircase_0.6.0_darwin_amd64.tar.gz"
      sha256 "e598463281d1a7e3ead2ddd079572c1bb79d27caff6b953ba97007c156c1fbbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.6.0/staircase_0.6.0_linux_arm64.tar.gz"
      sha256 "30b9b8aa869dab5b3d8528105df053daf55451f39024856d6ec50cea1e135578"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.6.0/staircase_0.6.0_linux_amd64.tar.gz"
      sha256 "21fd423d20d6d4bde35dc923de626e86506a6b5e85c9bbcafa1a07212b1a8ea7"
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
