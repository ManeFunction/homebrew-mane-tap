class Romlm < Formula
  desc "ROMs library management tool"
  homepage "https://github.com/ManeFunction/romlm"
  url "https://github.com/ManeFunction/romlm/releases/download/v1.0.1/romlm-1.0.1.tar.gz"
  sha256 "2acc3990777c08cd9dc3759b944ffecdb349a41c997ed50916c66f2c1656e934"
  license "MIT"

  depends_on "python@3.12"

  def install
    system "pip", "install", ".", "--prefix=#{prefix}"
  end

  test do
    output = shell_output("#{bin}/romlm -v")
    assert_match "ROMs Library Manager v#{version}", output
  end
end
