require 'formula'

class DBus < Formula
  homepage 'http://www.freedesktop.org/wiki/Software/dbus'
  url 'http://dbus.freedesktop.org/releases/dbus/dbus-1.4.8.tar.gz'
  sha256 '48bf73a35be0f0e2d9a5071d8f2d9c7c40b4254d9b405dee57f0fb07c9c3cf58'

  # Don't clean the empty directories that D-Bus needs
  skip_clean "etc/dbus-1/session.d"
  skip_clean "etc/dbus-1/system.d"
  skip_clean "var/run/dbus"

<<<<<<< HEAD
  def patches
<<<<<<< HEAD
    # Patches merged upstream for launchd support.
    # See http://bugs.freedesktop.org/show_bug.cgi?id=14259
    [ 'http://cgit.freedesktop.org/dbus/dbus/patch/?id=5125fc165454e81849a5b20c1e75b4f74bdbcd2c',
      'http://cgit.freedesktop.org/dbus/dbus/patch/?id=eb66c0a9c001ea08793b38470d12611ffaafa436',
      'http://cgit.freedesktop.org/dbus/dbus/patch/?id=f1b9aac417d8fb716d6ed19128fe429e8a41adba',
      'http://cgit.freedesktop.org/dbus/dbus/patch/?id=5232faad4039041ee178287eb528d8db13aa0f66' ]
=======
    # Last-minute build breakages for 1.4.1
    [ 'http://cgit.freedesktop.org/dbus/dbus/patch/?id=88004d6b66f80d72e97e9b6b024842d692e5748a',
      'http://cgit.freedesktop.org/dbus/dbus/patch/?id=56d8d4f58ee60cd4f860a99a2dd47b3f636321b8' ]
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
  end

=======
>>>>>>> 042169b16dfca2d3252bb0f727f07f25f4fb5695
  def install
    # Fix the TMPDIR to one D-Bus doesn't reject due to odd symbols
    ENV["TMPDIR"] = "/tmp"

<<<<<<< HEAD
    # Needed to regenerate configure for the patches to work
    system "autoreconf -ivf"
=======
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-xml-docs",
                          "--disable-doxygen-docs",
                          "--enable-launchd",
                          "--with-launchd-agent-dir=#{prefix}",
                          "--without-x"
    system "make"
    ENV.deparallelize
    system "make install"

    # Generate D-Bus's UUID for this machine
    system "#{bin}/dbus-uuidgen", "--ensure=#{prefix}/var/lib/dbus/machine-id"
  end

  def caveats; <<-EOS.undent
    If this is your first install, automatically load on login with:
        mkdir -p ~/Library/LaunchAgents
        cp #{prefix}/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

    If this is an upgrade and you already have the org.freedesktop.dbus-session.plist loaded:
        launchctl unload -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
        cp #{prefix}/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
    EOS
  end
end
