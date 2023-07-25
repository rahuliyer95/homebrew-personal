class PamWatchid < Formula
  desc "PAM plugin module that allows the Apple Watch to be used for authentication"
  homepage "https://github.com/rahuliyer95/pam-watchid"
  url "https://github.com/rahuliyer95/pam-watchid/archive/v2.0.tar.gz"
  sha256 "ac92759182eff4990e99354bbd20aedb9cdb7d56255cf0ae9fec32a3533c47b0"
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
