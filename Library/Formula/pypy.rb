require 'formula'
require 'hardware'

<<<<<<< HEAD
class Pypy <Formula
  if snow_leopard_64?
<<<<<<< HEAD
    url 'http://pypy.org/download/pypy-1.4-osx64.tar.bz2'
    md5 '23ed155d7a8a214c61efc9000d559383'
  else
    url 'http://pypy.org/download/pypy-1.4-osx.tar.bz2'
    md5 'b715229d2a2b4c7129f7867fd84e7caf'
  end
  homepage 'http://pypy.org/'
  version '1.4'
=======
=======
class Pypy < Formula
  if MacOS.prefer_64_bit?
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
    url 'http://pypy.org/download/pypy-1.4.1-osx64.tar.bz2'
    md5 '769b3fb134944ee8c22ad0834970de3b'
  else
    url 'http://pypy.org/download/pypy-1.4.1-osx.tar.bz2'
    md5 '8584c4e8c042f5b661fcfffa0d9b8a25'
  end
  homepage 'http://pypy.org/'
  version '1.4.1'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f

  def install
    prefix.install ["bin", "lib-python", "lib_pypy"]
  end
end
