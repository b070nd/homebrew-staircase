class Staircase < Formula
  desc "AI workspace orchestrator — structure your repos, manage agent context, switch between cases atomically"
  homepage "https://github.com/b070nd/stAirCase"
  url "https://github.com/b070nd/stAirCase/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "9bc0695bcc8686b4f058e43ae5da1b67145823381f270fdaf4faeb7fd0f89629"
  license "MIT"
  version "1.2.0"

  depends_on "jq"
  depends_on "bash"

  def install
    bin.install "staircase"
  end

  test do
    system "#{bin}/staircase", "--version"
  end
end
