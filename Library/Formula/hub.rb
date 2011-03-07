require 'formula'

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

  def install
    system "rake", "install", "prefix=#{prefix}"
  end
end
