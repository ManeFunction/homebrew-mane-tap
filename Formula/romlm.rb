class Romlm < Formula
  desc "ROMs library management tool"
  homepage "https://github.com/ManeFunction/romlm"
  version "1.0.2"
  url "https://github.com/ManeFunction/romlm/releases/download/v#{version}/romlm-#{version}.tar.gz"
  sha256 "ea03f8cc030fb626f6dd58f6f3fad779028b8e0667192251ce453da6850e2b04"
  license "MIT"

  depends_on "python@3.12"

  def install
    system "python3.12", "-m", "venv", "--clear", "--copies", libexec.to_s
    system "#{libexec}/bin/python", "-m", "ensurepip"
    system "#{libexec}/bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system "#{libexec}/bin/pip", "install", "."
    bin.install_symlink "#{libexec}/bin/romlm" => "romlm"
  end

  test do
    output = shell_output("#{bin}/romlm -v")
    assert_match "ROMs Library Manager v#{version}", output
  end
end
