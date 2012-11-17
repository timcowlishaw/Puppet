class ctags {
  exec { 'clone-fishman-ctags-repo':
    command => "/usr/bin/git clone git://github.com/fishman/ctags.git /tmp/ctags",
    unless => "/usr/bin/test -f /usr/local/bin/dropbox"
  }

  exec { 'configure-make-make-install-ctags':
    cwd => "/tmp/ctags",
    command => "/tmp/ctags/configure && /usr/bin/make && /usr/bin/make install",
    require => Exec["clone-fishman-ctags-repo"],
    onlyif => "/usr/bin/test -d /tmp/ctags"
  }

  file { "/tmp/ctags":
    force => true,
    ensure  => 'absent',
    require => Exec['configure-make-make-install-ctags'],
  }
  Class['base'] -> Class['ctags']
}
