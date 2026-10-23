class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  license "MIT"
  version_scheme 1 # orders the Go releases after the earlier Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.2.0/staircase_1.2.0_darwin_arm64.tar.gz"
      sha256 "e876848c05130626117e34239e9586be63a03e73041f928a3bec36bb6e40d252"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.2.0/staircase_1.2.0_darwin_amd64.tar.gz"
      sha256 "5114dbb325aaf1867bccbc36f491342a9974887c47b66413f5bfaf07286d0469"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.2.0/staircase_1.2.0_linux_arm64.tar.gz"
      sha256 "5b36ba4c60e391f5603ff3a744be8fd35e69ba6bae0a293ab3163876f4ee3418"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.2.0/staircase_1.2.0_linux_amd64.tar.gz"
      sha256 "236459c83591aa18042fe0518ff24c941d95786f2d96338b5e1bba77a6eebd24"
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
