class nodejs {

  $version="0.8.14"

  $arch = $::architecture ? {
    'i386'   => 'x86',
    'x86_64' => 'x64',
    'amd64'  => 'x64',
  }

  $filename="node-v${version}-linux-${arch}"
  $url="http://nodejs.org/dist/v${version}/${filename}.tar.gz"

  exec { 'download-nodejs':
    command => "/usr/bin/wget $url -O /tmp/${filename}.tar.gz",
    unless => "/usr/bin/test -f /usr/local/bin/node"
  }

  exec { 'untar-nodejs':
    cwd => "/tmp",
    command => "/bin/tar -xzvf ${filename}.tar.gz -C /usr/local",
    require => Exec['download-nodejs'],
    onlyif => "/usr/bin/test -f /tmp/${filename}.tar.gz"
  }

  exec { 'symlink-nodejs':
    command => "/bin/ln -s /usr/local/${filename} /usr/local/nodejs",
    unless => "/usr/bin/test -L /usr/local/nodejs",
    require => Exec['untar-nodejs']
}

  exec { 'symlink-node-executable':
    command  => "/bin/ln -s /usr/local/nodejs/bin/node /usr/local/bin/node",
    unless  => "/usr/bin/test -L /usr/local/bin/node",
    require => Exec['symlink-nodejs']
  }

  exec { 'symlink-node-waf-executable':
    command  => "/bin/ln -s /usr/local/nodejs/bin/node-waf /usr/local/bin/node-waf",
    unless  => "/usr/bin/test -L /usr/local/bin/node-waf",
    require => Exec['symlink-nodejs']
  }

  exec { 'symlink-npm-executable':
    command  => "/bin/ln -s /usr/local/nodejs/bin/npm /usr/local/bin/npm",
    unless  => "/usr/bin/test -L /usr/local/bin/npm",
    require => Exec['symlink-nodejs']
  }

  file { "/tmp/${filename}.tar.gz":
    ensure  => 'absent',
    require => Exec['untar-nodejs'],
  }

  Class['base'] -> Class['nodejs']
}
