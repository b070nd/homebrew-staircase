class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.5.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.5.0/staircase_0.5.0_darwin_arm64.tar.gz"
      sha256 "2901e8d5dc32220b1994e4e682449bc4dc7328874c7731bb4c834e2e0ba5cec5"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.5.0/staircase_0.5.0_darwin_amd64.tar.gz"
      sha256 "d3cd33b66f3dcc90a287e1769e0eb04f9d4c3b6e32ea835d0fe1f90fce9d7118"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.5.0/staircase_0.5.0_linux_arm64.tar.gz"
      sha256 "164b639af3a551289ebe0eb2e7aebdb760b5a81ae7e351206619b7d1dc3deca0"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.5.0/staircase_0.5.0_linux_amd64.tar.gz"
      sha256 "a1cc401d6b58159a4bb7a4d058c8bcc2f69ca26ac7e7ff251626020a802086ce"
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
