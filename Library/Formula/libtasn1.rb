require 'formula'

class Libtasn1 <Formula
<<<<<<< HEAD
  url 'http://ftp.gnu.org/gnu/libtasn1/libtasn1-2.8.tar.gz'
  homepage 'http://www.gnu.org/software/libtasn1/'
  md5 '53fd164f8670e55a9964666990fb358f'
=======
  url 'http://ftp.gnu.org/gnu/libtasn1/libtasn1-2.9.tar.gz'
  homepage 'http://www.gnu.org/software/libtasn1/'
  md5 'f4f4035b84550100ffeb8ad4b261dea9'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
