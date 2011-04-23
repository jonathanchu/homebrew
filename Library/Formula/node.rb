require 'formula'

<<<<<<< HEAD
class Node <Formula
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://nodejs.org/dist/node-v0.2.5.tar.gz'
  head 'git://github.com/ry/node.git'
  homepage 'http://nodejs.org/'
  md5 '7f6f99fefef172e0517657d0eb69b59d'
=======
  url 'http://nodejs.org/dist/node-v0.2.6.tar.gz'
  head 'git://github.com/ry/node.git'
  homepage 'http://nodejs.org/'
  md5 'b1c50ceb43bee1b221be210b7bc7a216'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
  url 'http://nodejs.org/dist/node-v0.4.2.tar.gz'
  head 'git://github.com/joyent/node.git'
  homepage 'http://nodejs.org/'
  md5 '9e9e791e125f6a601ebc663dc99c72a8'
>>>>>>> 449451b63fa3dd406987ddb2737797d4e50dda29
=======
class Node < Formula
  url 'http://nodejs.org/dist/node-v0.4.7.tar.gz'
  head 'git://github.com/joyent/node.git'
  homepage 'http://nodejs.org/'
  md5 '7b955c8d5897ab3f3d5c21b7a04abdec'

  fails_with_llvm
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695

  # Stripping breaks dynamic loading
  skip_clean :all

  def options
    [["--debug", "Build with debugger hooks."]]
  end

  def install
    inreplace 'wscript' do |s|
      s.gsub! '/usr/local', HOMEBREW_PREFIX
      s.gsub! '/opt/local/lib', '/usr/lib'
    end

    args = ["--prefix=#{prefix}"]
    args << "--debug" if ARGV.include? '--debug'

    system "./configure", *args
    system "make install"
  end

  def caveats
    "Please add #{HOMEBREW_PREFIX}/lib/node to your NODE_PATH environment variable to have node libraries picked up."
  end
end
