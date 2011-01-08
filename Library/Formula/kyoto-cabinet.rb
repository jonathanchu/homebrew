require 'formula'

class KyotoCabinet <Formula
<<<<<<< HEAD
  url 'http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.26.tar.gz'
  homepage 'http://fallabs.com/kyotocabinet/'
  md5 'ac0e13208b5391414462d89263227d24'
=======
  url 'http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.30.tar.gz'
  homepage 'http://fallabs.com/kyotocabinet/'
  md5 'cba58e553c5b8cc48c48552c56b15cf5'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f

  def install
    system "./configure", "--disable-debug", "--prefix=#{prefix}"
    system "make" # Separate steps required
    system "make install"
  end
end
