class Staircase < Formula
  desc "AI workspace orchestrator — structure your repos, manage agent context, switch between cases atomically"
  homepage "https://github.com/b070nd/stAirCase"
  url "https://github.com/b070nd/stAirCase/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d934fa63f6fc731f32c2b5aea850399cb9d9c9aab4fe303cf6dab892efaaadfd"
  license "MIT"
  version "1.0.0"

  depends_on "jq"
  depends_on "bash"

  def install
    bin.install "staircase"
  end

  test do
    system "#{bin}/staircase", "--version"
  end
end
