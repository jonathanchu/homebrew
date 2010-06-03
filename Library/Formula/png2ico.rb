require 'formula'

class Png2ico <Formula
  url 'http://www.winterdrache.de/freeware/png2ico/data/png2ico-src-2002-12-08.tar.gz'
  homepage 'http://www.winterdrache.de/freeware/png2ico/'
  md5 '9b663df81c826cd564638cba2e6bc75b'
  
  depends_on 'libpng'

  def install
    system "make"
    bin.install('png2ico')
  end
end