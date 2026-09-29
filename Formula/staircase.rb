class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.4.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.4.0/staircase_0.4.0_darwin_arm64.tar.gz"
      sha256 "17de25c489556b2ea8af8132c2dc179bc6cca159df8968721dbb3439ae36789e"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.4.0/staircase_0.4.0_darwin_amd64.tar.gz"
      sha256 "8015d8e3d87062072a1e21929c29bf01450acf9123412b6e87c3b37e1c62f32c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.4.0/staircase_0.4.0_linux_arm64.tar.gz"
      sha256 "6765697eac5dcb851c5e1db52b8eecf4d170dfff70c3fb88f4a303d4dde29768"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.4.0/staircase_0.4.0_linux_amd64.tar.gz"
      sha256 "54def561278539371a5059075fc856cc31eebac34f59ac52cbbeb4795109ed78"
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
