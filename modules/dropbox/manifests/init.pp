class dropbox(
  $user = undef,
  $dropbox_user = undef,
  $dropbox_password = undef
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
    command => "/usr/bin/wget -O /tmp/dropbox.py \"https://www.dropbox.com/download?dl=packages/dropbox.py\"",
    unless  => '/usr/bin/test -f /tmp/dropbox.py'
  }

  file { '/usr/local/bin/dropbox':
    source  => '/tmp/dropbox.py',
    mode    => 755,
    require => Exec['download-dropbox-cli']
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

  file { '/etc/init.d/dropbox':
    source => "puppet:///modules/dropbox/etc/init.d/dropbox",
    owner  => root,
    group  => root,
    mode   => 755,
  }

  file { '/tmp/authorize.rb':
    source => "puppet:///modules/dropbox/authorize.rb",
    owner => $user,
    group => $user,
    mode => 700,
  }

  exec { 'authorize-dropbox':
    command => "/tmp/authorize.rb ${user} ${dropbox_user} ${dropbox_password}",
    user => $user,
    group => 'dropbox',
    unless => "/usr/bin/test -f /home/${user}/.dropox/sigstore.dbx",
    creates => "/home/${user}/.dropbox/sigstore.dbx",
    require => File['authorize.rb'],
    before => Service['dropbox']
  }

  file { '/tmp/authorization.rb':
    ensure  => 'absent',
    require => Exec['authorize-dropbox'],
  }

  service { 'dropbox':
    ensure  => 'running',
    enable => 'true',
    require => File['dropbox']
  }

  Class['dropbox'] -> User[$user]
  Class['dropbox'] -> Class['base']
}
