require 'formula'

class Cmake <Formula
  url 'http://www.cmake.org/files/v2.8/cmake-2.8.3.tar.gz'
  md5 'a76a44b93acf5e3badda9de111385921'
  homepage 'http://www.cmake.org/'

  def patches
    # Adds support for enabling/disabling specific system libraries
    # http://public.kitware.com/Bug/view.php?id=11431
    # Shouldn't be needed in 2.8.4
    "http://cmake.org/gitweb?p=cmake.git;a=patch;h=60d72b56"
  end

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
