class python-dev {
  package {"python": ensure => "installed"}
  package {"python-dev": ensure => "installed"}
  package {"python-pip": ensure => "installed"}
  package {"ipython": ensure => "installed"}
  package {"ipython-qtconsole": ensure => "installed"}
  Class['base'] -> Class['python-dev']
}
