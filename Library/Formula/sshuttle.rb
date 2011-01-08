require 'formula'

class Sshuttle <Formula
<<<<<<< HEAD
  url 'https://github.com/apenwarr/sshuttle/tarball/sshuttle-0.43'
  homepage 'https://github.com/apenwarr/sshuttle'
  md5 '590352aa7cbaad90c8f46dab64b829f4'
  version '0.43'
=======
  url 'https://github.com/apenwarr/sshuttle/tarball/sshuttle-0.44'
  homepage 'https://github.com/apenwarr/sshuttle'
  md5 'c0d81604a8d864d0f52f2b6137b655a7'
  version '0.44'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f

  head 'git://github.com/apenwarr/sshuttle.git'

  def install
    libexec.install Dir['*']
    (bin+'sshuttle').write <<-EOS.undent
      #!/bin/bash
      exec #{libexec}/main.py "$@"
    EOS
  end
end
