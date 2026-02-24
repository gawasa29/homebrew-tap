class MacosAppReinstaller < Formula
  desc "Recreate app installation state after macOS clean install"
  homepage "https://github.com/gawasa29/macos-app-reinstaller"
  url "https://github.com/gawasa29/macos-app-reinstaller/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "45fd644f9c425804a6d857f017f2ec99928235de5befc1a16cd25c9cee450f83"
  license "MIT"

  depends_on :macos
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"macos-app-reinstaller"), "."
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/macos-app-reinstaller --help")
  end
end
