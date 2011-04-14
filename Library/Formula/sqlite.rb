require 'formula'

<<<<<<< HEAD
class Sqlite <Formula
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://www.sqlite.org/sqlite-amalgamation-3.7.3.tar.gz'
  md5 '74fe78b264f1c434c4b159d45b78e9b7'
=======
  url 'http://sqlite.org/sqlite-autoconf-3070400.tar.gz'
  md5 '8f0c690bfb33c3cbbc2471c3d9ba0158'
  version '3.7.4'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
=======
class Sqlite < Formula
<<<<<<< HEAD
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  url 'http://www.sqlite.org/sqlite-autoconf-3070500.tar.gz'
  md5 'a9604a82613ade2e7f4c303f233e477f'
  version '3.7.5'
>>>>>>> e32ce9fbd6836d8a9776dc7d10726274ac32ebfd
  homepage 'http://www.sqlite.org/'
=======
  homepage 'http://sqlite.org/'
  url 'http://sqlite.org/sqlite-autoconf-3070600.tar.gz'
  sha256 'c56417140f32f495827c90565a25c1b1068d1117ae368ea6ab58c01875d78771'
  version '3.7.6'
>>>>>>> 57572e1c9140cfb5e9f7ad64ef9d2c94f1b808e5

  def options
  [
    ["--with-rtree", "Enables the R*Tree index module"],
    ["--with-fts", "Enables the FTS Module"],
    ["--universal", "Build a universal binary."]
  ]
  end

  def install
    ENV.append "CFLAGS", "-DSQLITE_ENABLE_RTREE=1" if ARGV.include? "--with-rtree"
    ENV.append "CPPFLAGS","-DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS" if ARGV.include? "--with-fts"
    ENV.universal_binary if ARGV.include? "--universal"
    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking"
    system "make install"
  end
end
