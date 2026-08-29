# Homebrew formula for pidlens.
#
# Lives in the tap https://github.com/sthnaqvi/homebrew-tap as
# Formula/pidlens.rb, so users can:
#
#   brew tap sthnaqvi/tap
#   brew install pidlens
#
# After tagging a release, refresh url + sha256 with:
#   ./scripts/update-formula.sh 0.1.0
class Pidlens < Formula
  include Language::Python::Virtualenv

  desc "Everything macOS knows about a running process, in one readable report"
  homepage "https://github.com/sthnaqvi/pidlens"
  url "https://github.com/sthnaqvi/pidlens/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "59ff1293901372d0f8f242e7a8b19a27c9424a2cd4186455c8e791ce7f904e94"
  license "MIT"
  head "https://github.com/sthnaqvi/pidlens.git", branch: "main"

  depends_on :macos
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
    man1.install "docs/man/pidlens.1"
  end

  test do
    assert_match "pidlens #{version}", shell_output("#{bin}/pidlens --version")

    # A report for the test's own shell must render and mention the section headers.
    output = shell_output("#{bin}/pidlens #{Process.pid} --width 80")
    assert_match "IDENTITY", output
    assert_match "WHEN IT STARTED", output

    # And the JSON form must be parseable.
    require "json"
    data = JSON.parse(shell_output("#{bin}/pidlens #{Process.pid} --json"))
    assert_equal Process.pid, data["identity"]["pid"]

    # A pid that cannot exist exits 3, not 0.
    shell_output("#{bin}/pidlens 999999999", 3)
  end
end
