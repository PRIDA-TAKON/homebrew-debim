class Debim < Formula
  include Language::Python::Virtualenv

  desc "Minimal Git-native Declarative BIM engine & MCP Server for AI agents and humans"
  homepage "https://github.com/PRIDA-TAKON/debim"
  url "https://github.com/PRIDA-TAKON/debim/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cbf2695c19e012a9c2f24d22cda7ee9fb07552d139c406b9e52c0b8af6277082"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install "debim[all]==#{version}"
    bin.install_symlink libexec/"bin/debim"
    bin.install_symlink libexec/"bin/bim"
  end

  test do
    assert_match "debim version", shell_output("#{bin}/debim --version")
  end
end
