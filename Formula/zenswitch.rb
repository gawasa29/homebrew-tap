class Zenswitch < Formula
  desc "Close non-allowed running apps on macOS"
  homepage "https://github.com/gawasa29/zenswitch"
  url "https://github.com/gawasa29/zenswitch/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "65ccfdff9a83efa6e0760b78b2501cdd8b15d1ac732792130adac8f1dfb3f051"
  license "MIT"

  depends_on :macos
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"zen"), "./cmd/zen"
  end

  test do
    assert_match "ZenSwitch allowed apps:", shell_output("#{bin}/zen list")
  end
end
