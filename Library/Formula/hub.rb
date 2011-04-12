require 'formula'

<<<<<<< HEAD
class Hub <Formula
<<<<<<< HEAD
  url 'https://github.com/defunkt/hub/tarball/v1.4.1'
  homepage 'https://github.com/defunkt/hub'
  md5 '0b62ab79ac10962cab08bdb47c9f9d34'
=======
  url 'https://github.com/defunkt/hub/tarball/v1.5.0'
  homepage 'https://github.com/defunkt/hub'
  head 'git://github.com/defunkt/hub.git'
  md5 '3e719ea33cd2b78795dbfc6f8c5e41f8'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
class Hub < Formula
  url 'https://github.com/defunkt/hub/tarball/v1.6.0'
  homepage 'https://github.com/defunkt/hub'
  head 'git://github.com/defunkt/hub.git'
  md5 '6347bee90f0ae5b7b7fc5c9e971f61b8'
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695

  def install
    system "rake", "install", "prefix=#{prefix}"
  end
end
