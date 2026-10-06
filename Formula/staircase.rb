class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.10.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.10.0/staircase_0.10.0_darwin_arm64.tar.gz"
      sha256 "4594b796aae28cff7f572ecac06cd8f976fb971b329385b8833470e299faa9f2"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.10.0/staircase_0.10.0_darwin_amd64.tar.gz"
      sha256 "9253eb3d3f15468a0b13f5b7a0fb7394a08cbef652686d8ebe88133b77c968d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.10.0/staircase_0.10.0_linux_arm64.tar.gz"
      sha256 "701457f2132a8e7ddb836acf69ce273f836c9a4f9366768e8014c5711030f005"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.10.0/staircase_0.10.0_linux_amd64.tar.gz"
      sha256 "2e48214d22deb7a297ac0a2afdfee98d7b6b7b863943e64c94dc233318c9a962"
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
