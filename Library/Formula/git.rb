require 'formula'

class GitManuals < Formula
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://kernel.org/pub/software/scm/git/git-manpages-1.7.3.4.tar.bz2'
  md5 'ec0883134fa00628d9057d1551d9c739'
end

class GitHtmldocs < Formula
  url 'http://kernel.org/pub/software/scm/git/git-htmldocs-1.7.3.4.tar.bz2'
  md5 '2adbb534b28be52145ddd9bb5cca2f93'
end

class Git < Formula
  url 'http://kernel.org/pub/software/scm/git/git-1.7.3.4.tar.bz2'
  md5 '3a2602016f98c529cda7b9fad1a6e216'
=======
  url 'http://kernel.org/pub/software/scm/git/git-manpages-1.7.3.5.tar.bz2'
  md5 '75d9db900fbbde05cdd6d30da6e4f1f5'
=======
  url 'http://kernel.org/pub/software/scm/git/git-manpages-1.7.4.tar.bz2'
  md5 'd13d42846a72335eb287e55bc980dc09'
>>>>>>> e32ce9fbd6836d8a9776dc7d10726274ac32ebfd
=======
  url 'http://kernel.org/pub/software/scm/git/git-manpages-1.7.4.1.tar.bz2'
  md5 'ac3e15c568e887af4517a01e16671947'
>>>>>>> 449451b63fa3dd406987ddb2737797d4e50dda29
=======
  url 'http://kernel.org/pub/software/scm/git/git-manpages-1.7.4.4.tar.bz2'
  md5 '5812f4fca4afc6c81e06f485111ec8ab'
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
end

class GitHtmldocs < Formula
  url 'http://kernel.org/pub/software/scm/git/git-htmldocs-1.7.4.4.tar.bz2'
  md5 '71e40b22e5d4b54f69ac1e8e0ca1670b'
end

class Git < Formula
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://kernel.org/pub/software/scm/git/git-1.7.3.5.tar.bz2'
  md5 '8a8cd93b8a4dff0a03c0fdc77253af3e'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
  url 'http://kernel.org/pub/software/scm/git/git-1.7.4.tar.bz2'
  md5 'fa24dc1ef0b663327ea0fe1981365b39'
>>>>>>> e32ce9fbd6836d8a9776dc7d10726274ac32ebfd
=======
  url 'http://kernel.org/pub/software/scm/git/git-1.7.4.1.tar.bz2'
  md5 '76898de4566d11c0d0eec7e99edc2b5c'
>>>>>>> 449451b63fa3dd406987ddb2737797d4e50dda29
=======
  url 'http://kernel.org/pub/software/scm/git/git-1.7.4.4.tar.bz2'
  md5 '1313f71d62fa100b32fa313769a85f2a'
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  homepage 'http://git-scm.com'

  def install
    # if these things are installed, tell git build system to not use them
    ENV['NO_FINK']='1'
    ENV['NO_DARWIN_PORTS']='1'
    # If local::lib is used you get a 'Only one of PREFIX or INSTALL_BASE can be given' error
    ENV['PERL_MM_OPT']=''
    # build verbosely so we can debug better
    ENV['V']='1'

    inreplace "Makefile" do |s|
      s.remove_make_var! %w{CFLAGS LDFLAGS}
    end

    system "make", "prefix=#{prefix}", "install"

    # Install the git bash completion file.
    # Put it into the Cellar so that it gets upgraded along with git upgrades.
    (prefix+'etc/bash_completion.d').install 'contrib/completion/git-completion.bash'

    # Install emacs support.
    (share+'doc/git-core/contrib').install 'contrib/emacs'

    # Install contrib files to share/contrib
    (share).install 'contrib'

    # these files are exact copies of the git binary, so like the contents
    # of libexec/git-core lets hard link them
    # I am assuming this is an overisght by the git devs
    git_md5 = (bin+'git').md5
    %w[git-receive-pack git-upload-archive].each do |fn|
      fn = bin + fn
      next unless git_md5 == fn.md5
      fn.unlink
      fn.make_link bin+'git'
    end

    # we could build the manpages ourselves, but the build process depends
    # on many other packages, and is somewhat crazy, this way is easier
    GitManuals.new.brew { man.install Dir['*'] }
    GitHtmldocs.new.brew { (share+'doc/git-doc').install Dir['*'] }
  end

  def caveats; <<-EOS.undent
    Bash completion has been installed to:
      #{prefix}/etc/bash_completion.d/

    Emacs support has been installed to:
      #{share}/doc/git-core/contrib/emacs/

    The rest of the "contrib" has been installed to:
      #{share}/contrib
    EOS
  end
end
