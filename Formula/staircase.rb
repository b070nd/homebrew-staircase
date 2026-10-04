class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.7.1"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.1/staircase_0.7.1_darwin_arm64.tar.gz"
      sha256 "0b5966850f910ccb9a67338fac86096bf8952de06349c4281810689b443942e4"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.1/staircase_0.7.1_darwin_amd64.tar.gz"
      sha256 "6e14ec8c8e2bebea89fb9dd38ef45b78dba6de53dd68ba504af36f310db3c639"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.1/staircase_0.7.1_linux_arm64.tar.gz"
      sha256 "0f872e3a2f4a2f7b77c4802f1db7d5bc7b684db8fa7630a10a23db31aa3345cf"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.7.1/staircase_0.7.1_linux_amd64.tar.gz"
      sha256 "f11e461b23c0b8a682beb901cb03f2abb10dee26b6984656f094a51a0b08c7cd"
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
