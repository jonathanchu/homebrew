require 'formula'

<<<<<<< HEAD
class Lsof <Formula
<<<<<<< HEAD
  url 'ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof.tar.bz2'
=======
=======
class Lsof < Formula
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  url 'ftp://sunsite.ualberta.ca/pub/Mirror/lsof/lsof_4.84.tar.bz2'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
  version '4.84'
  md5 'a09326df500ef7e4550af546868338d6'
  homepage 'http://people.freebsd.org/~abe/'

  def install
    system "tar xf lsof_4.84_src.tar"
    Dir.chdir "lsof_4.84_src" do
      mv "00README", "../README"
      system "./Configure -n darwin"
      system "make"
      bin.install "lsof"
    end
  end
end
