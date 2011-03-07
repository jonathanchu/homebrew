require 'formula'

# This formula provides the libvirt daemon (libvirtd), development libraries, and the
# virsh command line tool.  This allows people to manage their virtualisation servers
# remotely, and (as this continues to be developed) manage virtualisation servers
# running on the local host

class Libvirt <Formula
  homepage 'http://www.libvirt.org'
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://libvirt.org/sources/libvirt-0.8.6.tar.gz'
  sha256 '99d5f6f6890eaa78887832e218c01c79c410b6e76d8d526980906808e2487220'
=======
  url 'http://libvirt.org/sources/libvirt-0.8.7.tar.gz'
  sha256 'da7b0e8bff7b2df2e19d732272674599bfb805787fb0d6f30289ba700ca77f31'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
  url 'http://libvirt.org/sources/libvirt-0.8.8.tar.gz'
  sha256 '030aea3728917053555bec98d93d2855e8a603b758c0b2a5d57ac48b4f39e113'
>>>>>>> 449451b63fa3dd406987ddb2737797d4e50dda29

  depends_on "gnutls"
  depends_on "yajl"

  if MACOS_VERSION < 10.6
    # Definitely needed on Leopard, but definitely not Snow Leopard.
    # Likely also needed on earlier OSX releases, though that hasn't
    # been tested yet.
    depends_on "readline"
    depends_on "libxml2"
  end

  def options
    [['--without-libvirtd', 'Build only the virsh client and development libraries.']]
  end

  def install
    fails_with_llvm "Undefined symbols when linking", :build => "2326"

    args = ["--prefix=#{prefix}",
            "--localstatedir=#{var}",
            "--mandir=#{man}",
            "--sysconfdir=#{etc}",
            "--with-esx",
            "--with-init-script=none",
            "--with-openvz",
            "--with-remote",
            "--with-test",
            "--with-vbox=check",
            "--with-vmware",
            "--with-yajl"]

    args << "--without-libvirtd" if ARGV.include? '--without-libvirtd'

    system "./configure", *args

    # Compilation of docs doesn't get done if we jump straight to "make install"
    system "make"
    system "make install"

    # Update the SASL config file with the Homebrew prefix
    inreplace "#{etc}/sasl2/libvirt.conf" do |s|
      s.gsub! "/etc/", "#{HOMEBREW_PREFIX}/etc/"
      s.gsub! "/var/", "#{HOMEBREW_PREFIX}/var/"
    end

    # If the libvirt daemon is built, update its config file to reflect
    # the Homebrew prefix
    unless ARGV.include? '--without-libvirtd'
      inreplace "#{etc}/libvirt/libvirtd.conf" do |s|
        s.gsub! "/etc/", "#{HOMEBREW_PREFIX}/etc/"
        s.gsub! "/var/", "#{HOMEBREW_PREFIX}/var/"
      end
    end
  end
end
