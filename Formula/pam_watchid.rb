class PamWatchid < Formula
  desc "PAM plugin module that allows the Apple Watch to be used for authentication"
  homepage "https://github.com/rahuliyer95/pam-watchid"
  url "https://github.com/rahuliyer95/pam-watchid/archive/v2.1.tar.gz"
  sha256 "1b809ec3e9d4bf75a19836bebf3263de18c247d3b5647af0e02c173951aa3cea"
  head "https://github.com/rahuliyer95/pam-watchid.git"


  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats; <<~EOS
    Make sure you add the module to your targeted service in /etc/pam.d/:

      auth  sufficient  #{Hardware::CPU.arm? ? (prefix.to_str + "/lib/pam/") : ""}pam_watchid.so
      ...

    See https://github.com/rahuliyer95/pam-watchid
  EOS
  end
end
