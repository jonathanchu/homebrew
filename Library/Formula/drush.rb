require 'formula'

class DrushMake <Formula
  url 'http://ftp.drupal.org/files/projects/drush_make-6.x-2.0-beta10.tar.gz'
  homepage 'http://drupal.org/project/drush_make'
  md5 '3be3c6473198652900f7695e09a1806c'
end

class Drush <Formula
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://ftp.drupal.org/files/projects/drush-6.x-4.0-rc3.tar.gz'
  homepage 'http://drupal.org/project/drush'
  version '4.0-rc3' # Lets be explicit here
  md5 '87659a5b3559f9eb7ef0a16c320a01ad'
=======
  url 'http://ftp.drupal.org/files/projects/drush-6.x-4.0-rc7.tar.gz'
  homepage 'http://drupal.org/project/drush'
  version '4.0-rc7'
  md5 '327e09a3fd9eef6c918ea1eac2ceb312'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
  url 'http://ftp.drupal.org/files/projects/drush-All-versions-4.1.tar.gz'
  homepage 'http://drupal.org/project/drush'
  version '4.1'
  md5 '880997e341af70ee84a99cdc98b35eb9'
>>>>>>> 76f99dad4b457774743d5d06f21e15a4a6949c9e

  def install
    prefix.install Dir['*'] # No lib folder, so this is OK for now.
    bin.mkpath
    symlink prefix+'drush', bin+'drush'
    DrushMake.new.brew { (prefix+'commands/drush_make').install Dir['*'] }
  end
end
