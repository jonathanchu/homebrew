require 'formula'

class Rubinius < Formula
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://asset.rubini.us/rubinius-1.1.1-20101116.tar.gz'
  version '1.1.1'
  homepage 'http://rubini.us/'
  md5 'b39f618eeba37c3aff215da8bca55fd7'
=======
  url 'http://asset.rubini.us/rubinius-1.2.0-20101221.tar.gz'
  version '1.2.0'
  homepage 'http://rubini.us/'
  md5 '4284c2660f1f648942de35d4fc871f70'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
  url 'http://asset.rubini.us/rubinius-1.2.2-20110222.tar.gz'
  version '1.2.2'
  homepage 'http://rubini.us/'
  sha1 '55a931b3377d5d70426acdb507ad1489aae9d5cc'
>>>>>>> 449451b63fa3dd406987ddb2737797d4e50dda29
=======
  homepage 'http://rubini.us/'
  url 'http://asset.rubini.us/rubinius-1.2.3-20110315.tar.gz'
  version '1.2.3'
  sha1 '7326e27f459e299dd0c2905de9b54034cc70ccbe'
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  head 'git://github.com/evanphx/rubinius.git'

  # Do not strip binaries, or else it fails to run.
  skip_clean :all

  def install
    # Let Rubinius define its own flags; messing with these causes build breaks.
    %w{CC CXX LD CFLAGS CXXFLAGS CPPFLAGS LDFLAGS}.each { |e| ENV.delete(e) }

<<<<<<< HEAD
    system "/usr/bin/ruby", "./configure",
                          "--skip-system", # download and use the prebuilt LLVM
=======
    # Unset RUBYLIB to configure Rubinius
    ENV.delete("RUBYLIB")

    # Set to stop Rubinius messing with our prefix.
    ENV["RELEASE"] = "1"

    system "/usr/bin/ruby", "./configure",
                          "--skip-system", # download and use the prebuilt LLVM
                          "--bindir", bin,
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
                          "--prefix", prefix,
                          "--includedir", "#{include}/rubinius",
                          "--libdir", lib,
                          "--mandir", man, # For completeness; no manpages exist yet.
                          "--gemsdir", "#{lib}/rubinius/gems"

    ohai "config.rb", File.open('config.rb').to_a if ARGV.debug? or ARGV.verbose?

    system "/usr/bin/ruby", "-S", "rake", "install"

    # Remove conflicting command aliases
    bin.children.select(&:symlink?).each(&:unlink)
  end

  def caveats; <<-EOS.undent
    Consider using RVM or Cinderella to manage Ruby environments:
      * RVM: http://rvm.beginrescueend.com/
      * Cinderella: http://www.atmos.org/cinderella/
    EOS
  end
end
