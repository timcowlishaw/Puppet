class android-dev {

  if $::architecture == 'x86_64' or $::architecture == 'amd64' {
    package {"ia32-libs": ensure => "installed"}
  }

  exec {'download-android-sdk':
    command => "/usr/bin/wget -O /tmp/android-sdk.tar.gz \"http://dl.google.com/android/android-sdk_r20.0.3-linux.tgz\"",
    unless => "/usr/bin/test -d /usr/local/android-sdk-linux"
  }

  exec {'unpack-android-sdk':
    command => "/bin/tar -zxvf /tmp/android-sdk.tar.gz -C /usr/local",
    require => Exec['download-android-sdk']
  }

  Class['base'] -> Class['android-dev']
  Class['sun-java'] -> Class['android-dev']
}
