require 'formula'

class KyotoCabinet <Formula
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.26.tar.gz'
  homepage 'http://fallabs.com/kyotocabinet/'
  md5 'ac0e13208b5391414462d89263227d24'
=======
  url 'http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.30.tar.gz'
  homepage 'http://fallabs.com/kyotocabinet/'
  md5 'cba58e553c5b8cc48c48552c56b15cf5'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
  url 'http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.34.tar.gz'
  homepage 'http://fallabs.com/kyotocabinet/'
  md5 '47f074648e5c4cc619be7be3cb05c3b0'
>>>>>>> 76f99dad4b457774743d5d06f21e15a4a6949c9e
=======
  url 'http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.47.tar.gz'
  homepage 'http://fallabs.com/kyotocabinet/'
  md5 '7a90ecb06d3c598568cfbc74021f7076'
>>>>>>> 449451b63fa3dd406987ddb2737797d4e50dda29

  def install
    system "./configure", "--disable-debug", "--prefix=#{prefix}"
    system "make" # Separate steps required
    system "make install"
  end
end
