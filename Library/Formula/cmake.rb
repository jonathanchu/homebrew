require 'formula'

class Cmake < Formula
  url 'http://www.cmake.org/files/v2.8/cmake-2.8.4.tar.gz'
  md5 '209b7d1d04b2e00986538d74ba764fcf'
  homepage 'http://www.cmake.org/'

  def install
<<<<<<< HEAD
=======
    # A framework-installed expat will be detected and mess things up.
    if File.exist? "/Library/Frameworks/expat.framework"
      opoo "/Library/Frameworks/expat.framework detected"
      puts <<-EOS.undent
        This will be picked up by Cmake's build system and likey cause the
        build to fail, trying to link to a 32-bit version of expat.
        You may need to move this file out of the way for this brew to work.
      EOS
    end

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
    # If we specify to CMake to use the system libraries by passing
    # --system-libs to bootstrap then it insists on finding them all
    # or erroring out, as that's what other Linux/OSX distributions
    # would want. I've requested that they either fix this or let us
    # submit a patch to do so on their bug tracker:
    # http://www.cmake.org/Bug/view.php?id=11431
    inreplace 'CMakeLists.txt',
              "# Mention to the user what system libraries are being used.",
              "SET(CMAKE_USE_SYSTEM_LIBARCHIVE 0)"

=======
>>>>>>> 76f99dad4b457774743d5d06f21e15a4a6949c9e
=======
    if ENV['GREP_OPTIONS'] == "--color=always"
      opoo "GREP_OPTIONS is set to '--color=always'"
      puts <<-EOS.undent
        Having `GREP_OPTIONS` set this way causes Cmake builds to fail.
        You will need to `unset GREP_OPTIONS` before brewing.
      EOS
    end

>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
    system "./bootstrap", "--prefix=#{prefix}",
                          "--system-libs",
                          "--no-system-libarchive",
                          "--datadir=/share/cmake",
                          "--docdir=/share/doc/cmake",
                          "--mandir=/share/man"
    system "make"
    system "make install"
  end
end
