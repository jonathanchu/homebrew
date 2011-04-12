require 'formula'

<<<<<<< HEAD
class Autojump <Formula
<<<<<<< HEAD
  url 'https://github.com/downloads/joelthelion/autojump/autojump_v13.tar.gz'
  homepage 'https://github.com/joelthelion/autojump/wiki'
  md5 '13e4e6173f4ed63b8babb00fcd95f600'
  version '13'
=======
=======
class Autojump < Formula
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  url 'https://github.com/downloads/joelthelion/autojump/autojump_v14.tar.gz'
  homepage 'https://github.com/joelthelion/autojump/wiki'
  md5 '7c0a41a2d33aee11a844dc17f7825dc9'
  version '14'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f

  def install
    bin.install "autojump"
    man1.install "autojump.1"

    inreplace "autojump.sh", '/etc/profile.d/', (prefix+'etc/')
    (prefix+'etc').install "autojump.sh" => "autojump"
    (prefix+'etc').install ["autojump.bash", "autojump.zsh"]
  end

  def caveats; <<-EOS.undent
    Add the following lines to your ~/.bash_profile file:
    if [ -f `brew --prefix`/etc/autojump ]; then
      . `brew --prefix`/etc/autojump
    fi
    EOS
  end
end
