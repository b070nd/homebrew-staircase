class Staircase < Formula
  desc "AI workspace orchestrator — structure your repos, manage agent context, switch between cases atomically"
  homepage "https://github.com/b070nd/stAirCase"
  url "https://github.com/b070nd/stAirCase/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "8a259b8414d507c452cc5961b1c3972406769c26a1a8e3d14c48e3ffb34c2ef5"
  license "MIT"
  version "1.4.0"

  depends_on "jq"
  depends_on "bash"

  def install
    bin.install "staircase"
  end

  test do
    system "#{bin}/staircase", "--version"
  end
end
