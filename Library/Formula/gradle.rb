require 'formula'

class Gradle <Formula
  homepage 'http://www.gradle.org/'
<<<<<<< HEAD
<<<<<<< HEAD
  url 'http://dist.codehaus.org/gradle/gradle-0.8-all.zip'
  head 'http://dist.codehaus.org/gradle/gradle-0.9-rc-3-all.zip'

  if ARGV.build_head?
    version '0.9-rc-3'
    md5 'ec578c2069a30fb8b5f669df6a72034d'
  else
    version '0.8'
    md5 '73a0ed51b6ec00a7d3a9d242d51aae60'
  end
=======
  version '0.9.1'
  url 'http://gradle.artifactoryonline.com/gradle/distributions/gradle-0.9.1-all.zip'
  md5 '8fa0acfbcdf01a8425c1f797f5079e21'
>>>>>>> 42bfd08ffc2d2799232afe062df0bbad16c59a0f
=======
  version '0.9.2'
  url 'http://gradle.artifactoryonline.com/gradle/distributions/gradle-0.9.2-all.zip'
  md5 '8574a445267ce3ad21558e300d854d24'
>>>>>>> e32ce9fbd6836d8a9776dc7d10726274ac32ebfd

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    bin.mkpath
    ln_s libexec+('bin/gradle'), bin
  end
end
