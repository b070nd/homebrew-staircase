class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  license "MIT"
  version_scheme 1 # orders the Go releases after the earlier Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.1.0/staircase_1.1.0_darwin_arm64.tar.gz"
      sha256 "a519f4cc65f578d5879ad64385dea98b0b32424af66960d244ac077cb2d5ffa6"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.1.0/staircase_1.1.0_darwin_amd64.tar.gz"
      sha256 "e706e1eab5c0b4ae931f2f48d267a60f2607f44190d6696a7a006fdaf074f434"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.1.0/staircase_1.1.0_linux_arm64.tar.gz"
      sha256 "3e29181b8a7be50dc500d6429f31a00e8565f8b887f69e076837745b51f512bf"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.1.0/staircase_1.1.0_linux_amd64.tar.gz"
      sha256 "bfc0c53ca64b69dd526a35ea74d62dcd9ca9d422fa4174cb40f52a04d1195035"
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
