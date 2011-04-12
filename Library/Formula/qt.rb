require 'formula'
require 'hardware'

class Qt < Formula
  url 'http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-4.7.2.tar.gz'
  md5 '66b992f5c21145df08c99d21847f4fdb'
  homepage 'http://qt.nokia.com/'

<<<<<<< HEAD
<<<<<<< HEAD
  def patches
    # To fix http://bugreports.qt.nokia.com/browse/QTBUG-13623. Patch sent upstream.
<<<<<<< HEAD
    "http://qt.gitorious.org/~mikemcquaid/qt/mikemcquaid-qt/commit/ca2e8b6dc176576f7217f4b7209994eddad1a358.patch"
=======
    "http://qt.gitorious.org/qt/qt/commit/9f18a1ad5ce32dd397642a4c03fa1fcb21fb9456.patch"
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
  end

=======
>>>>>>> 449451b63fa3dd406987ddb2737797d4e50dda29
=======
  def patches
    "http://qt.nokia.com/files/qt-patches/blacklist-fraudulent-comodo-certificates-patch.diff"
  end

>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  def options
    [
      ['--with-qtdbus', "Enable QtDBus module."],
      ['--with-qt3support', "Enable deprecated Qt3Support module."],
      ['--with-demos-examples', "Enable Qt demos and examples."],
      ['--with-debug-and-release', "Compile Qt in debug and release mode."],
      ['--universal', "Build both x86_64 and x86 architectures."],
    ]
  end

  depends_on "d-bus" if ARGV.include? '--with-qtdbus'
  depends_on 'sqlite' if MacOS.leopard?

  def install
    ENV.x11
    ENV.append "CXXFLAGS", "-fvisibility=hidden"
    args = ["-prefix", prefix,
            "-system-libpng", "-system-zlib",
            "-L/usr/X11R6/lib", "-I/usr/X11R6/include",
            "-confirm-license", "-opensource",
            "-cocoa", "-fast" ]

    # See: https://github.com/mxcl/homebrew/issues/issue/744
    args << "-system-sqlite" if MacOS.leopard?
    args << "-plugin-sql-mysql" if (HOMEBREW_CELLAR+"mysql").directory?

    if ARGV.include? '--with-qtdbus'
      args << "-I#{Formula.factory('d-bus').lib}/dbus-1.0/include"
      args << "-I#{Formula.factory('d-bus').include}/dbus-1.0"
    end

    if ARGV.include? '--with-qt3support'
      args << "-qt3support"
    else
      args << "-no-qt3support"
    end

    if ARGV.include? '--with-debug-and-release'
      args << "-debug-and-release"
    else
      args << "-release"
    end

    unless ARGV.include? '--with-demos-examples'
      args << "-nomake" << "demos" << "-nomake" << "examples"
    end

    if MacOS.prefer_64_bit? or ARGV.include? '--universal'
      args << '-arch' << 'x86_64'
    end

    if !MacOS.prefer_64_bit? or ARGV.include? '--universal'
      args << '-arch' << 'x86'
    end

    system "./configure", *args
    system "make"
    ENV.j1
    system "make install"

    # stop crazy disk usage
    (prefix+'doc/html').rmtree
    (prefix+'doc/src').rmtree
    # what are these anyway?
    (bin+'pixeltool.app').rmtree
    (bin+'qhelpconverter.app').rmtree
    # remove porting file for non-humans
    (prefix+'q3porting.xml').unlink

    # Some config scripts will only find Qt in a "Frameworks" folder
    # VirtualBox is an example of where this is needed
    # See: https://github.com/mxcl/homebrew/issues/issue/745
    cd prefix do
      ln_s lib, "Frameworks"
    end
  end

  def caveats
    "We agreed to the Qt opensource license for you.\nIf this is unacceptable you should uninstall."
  end
end
