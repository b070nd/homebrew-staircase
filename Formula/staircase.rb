class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  license "MIT"
  version_scheme 1 # orders the Go releases after the earlier Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.1/staircase_1.0.1_darwin_arm64.tar.gz"
      sha256 "061bd8e0c37890748cb46f445337cfaa968c92553ba2b28e2c36ca432d7aa811"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.1/staircase_1.0.1_darwin_amd64.tar.gz"
      sha256 "329f9543645667b02eec400dae0a87eba7c17c75cae6f5ac308d95fbaf71c2cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.1/staircase_1.0.1_linux_arm64.tar.gz"
      sha256 "7281b9bc5d6c96c038667e815fb1b80381d347fff36888df9808ea6b89a3811d"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v1.0.1/staircase_1.0.1_linux_amd64.tar.gz"
      sha256 "65a90fa5159e50aa006bba1ab236c0d6812cdb8ef4f5a5699eec9087f1c92e91"
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
