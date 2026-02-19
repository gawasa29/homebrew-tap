class ZenCli < Formula
  desc "Close non-allowed running apps on macOS"
  homepage "https://github.com/gawasa29/zen-cli"
  url "https://github.com/gawasa29/zen-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c6aed00915ee5b4ba25548e5450904fa5befad2800948484a9ca19be0bd20d57"
  license "MIT"

  depends_on :macos
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"zen"), "./cmd/zen"
  end

  test do
    assert_match "zen-cli allowed apps:", shell_output("#{bin}/zen list")
  end
end
