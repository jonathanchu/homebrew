require 'formula'

<<<<<<< HEAD
class Ranger <Formula
<<<<<<< HEAD
  url 'http://nongnu.org/ranger/ranger-stable.tar.gz'
=======
  url 'http://download.savannah.gnu.org/releases/ranger/releases/ranger-1.2.3.tar.gz'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
  version '1.2.3'
=======
class Ranger < Formula
  url 'http://git.savannah.gnu.org/cgit/ranger.git/snapshot/ranger-1.4.3.tar.gz'
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  homepage 'http://ranger.nongnu.org/'
  md5 '90eccff2305a9500181c78fb6803a621'

  def install
    man1.install 'doc/ranger.1'
    libexec.install ['ranger.py', 'ranger']
    bin.mkpath
    ln_s libexec+'ranger.py', bin+'ranger'
  end
end
