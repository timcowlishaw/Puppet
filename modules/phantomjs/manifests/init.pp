class phantomjs {
  $download_arch = $::architecture ? {
    'i386' => 'i686',
    'x86_64' => 'x86_64',
    'amd64' => 'x86_64'
  }

  exec { 'download-phantomjs':
    command => "/usr/bin/wget -O /tmp/phantomjs.tar.bz2 \"http://phantomjs.googlecode.com/files/phantomjs-1.7.0-linux-${download_arch}.tar.bz2\"",
    unless => "/usr/bin/test -L /usr/local/phantomjs"
  }

  exec { 'install-phantomjs':
    command => "/bin/tar -xjf /tmp/phantomjs.tar.bz2 -C /usr/local",
    unless => "/usr/bin/test -d /usr/local/phantomjs-1.7.0-linux-${download_arch}",
    require => Exec['download-phantomjs']
  }

  exec { 'symlink-phantomjs':
    command => "/bin/ln -s /usr/local/phantomjs-1.7.0-linux-${download_arch} /usr/local/phantomjs",
    unless => "/usr/bin/test -L /usr/local/phantomjs",
    require => Exec['install-phantomjs']
}

  exec { 'symlink-phantomjs-executable':
    command  => "/bin/ln -s /usr/local/phantomjs/bin/phantomjs /usr/local/bin/phantomjs",
    unless  => "/usr/bin/test -L /usr/local/bin/phantomjs",
    require => Exec['symlink-phantomjs']
  }

  file { "/tmp/phantomjs.tar.bz2":
    ensure  => 'absent',
    require => Exec['install-phantomjs'],
  }
  Class['base'] -> Class['phantomjs']
}
