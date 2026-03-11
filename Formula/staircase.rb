class Staircase < Formula
  desc "AI workspace orchestrator — structure your repos, manage agent context, switch between cases atomically"
  homepage "https://github.com/b070nd/stAirCase"
  url "https://github.com/b070nd/stAirCase/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "2171e3aee355dbf849c18bf4f8087ae0a4f14307180ac889491907ca97ea7ad9"
  license "MIT"
  version "1.1.0"

  depends_on "jq"
  depends_on "bash"

  def install
    bin.install "staircase"
  end

  test do
    system "#{bin}/staircase", "--version"
  end
end
