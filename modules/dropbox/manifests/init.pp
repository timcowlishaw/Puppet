class dropbox(
  $user = undef,
) {

  $download_arch = $::architecture ? {
    'i386'   => 'x86',
    'x86_64' => 'x86_64',
    'amd64'  => 'x86_64',
  }

  group { 'dropbox':
    ensure => present,
  }

  exec { 'download-dropbox-cli':
    command => "/usr/bin/wget -O /usr/local/bin/dropbox \"https://www.dropbox.com/download?dl=packages/dropbox.py\"",
    unless  => '/usr/bin/test -f /usr/local/bin/dropbox'
  }

  file { '/usr/local/bin/dropbox':
    ensure => 'present',
    mode    => 755,
    require => Exec['download-dropbox-cli'],
  }

  exec { 'download-dropbox':
    command => "/usr/bin/wget -O /tmp/dropbox.tar.gz \"http://www.dropbox.com/download/?plat=lnx.${download_arch}\"",
    unless => "/usr/bin/test -d ~${user}/.dropbox-dist",
    require => User[$user],
  }

  exec { 'install-dropbox':
    command => "/bin/tar -zxvf /tmp/dropbox.tar.gz -C ~${user}",
    unless => "/usr/bin/test -d ~${user}/.dropbox-dist",
    require => Exec['download-dropbox'],
  }

  file { '/tmp/dropbox.tar.gz':
    ensure  => 'absent',
    require => Exec['install-dropbox'],
  }

  exec { '/usr/local/bin/dropbox autostart y || true':
    user => $user,
    group => $user,
    require => Exec['install-dropbox']
  }

  Class['base'] -> Class['dropbox']
}
