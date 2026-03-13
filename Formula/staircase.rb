class Staircase < Formula
  desc "AI workspace orchestrator — structure your repos, manage agent context, switch between cases atomically"
  homepage "https://github.com/b070nd/stAirCase"
  url "https://github.com/b070nd/stAirCase/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "ebf7bd1c732170ab74ad40810aac1aaf72f073dbf8c524dbddc79cf9831be0a7"
  license "MIT"
  version "1.3.0"

  depends_on "jq"
  depends_on "bash"

  def install
    bin.install "staircase"
  end

  test do
    system "#{bin}/staircase", "--version"
  end
end
