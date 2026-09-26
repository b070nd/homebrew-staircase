class Staircase < Formula
  desc "Enforcement gate between AI agent plans and your codebase"
  homepage "https://github.com/b070nd/stAirCase"
  version "0.2.0"
  license "MIT"
  version_scheme 1 # the Go rewrite restarts at 0.x after the Bash 1.x line

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.2.0/staircase_0.2.0_darwin_arm64.tar.gz"
      sha256 "eb0c492d9c2146ee8d19bec8c9b9b611a84785fa8d55655638d6c1115fd7b7dc"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.2.0/staircase_0.2.0_darwin_amd64.tar.gz"
      sha256 "e8319afdf7ce1e721f5842cd21d390a9bc1d8bb4281651c77c30a785d39d0df5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.2.0/staircase_0.2.0_linux_arm64.tar.gz"
      sha256 "7ddcbee1cbc33b79f9dd55ecd29a6eab5b36c2b1a648d06b21691818be05a81d"
    end
    on_intel do
      url "https://github.com/b070nd/stAirCase/releases/download/v0.2.0/staircase_0.2.0_linux_amd64.tar.gz"
      sha256 "1822df3c780cb74c4771eb9d0299c478e7cc6e6a96efd8fb4ee7d70efce1a911"
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
