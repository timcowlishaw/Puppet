class mysql {
  package {'mysql-client': ensure => 'installed'}
  package {'mysql-server': ensure => 'installed'}
  package {'libmysqlclient-dev': ensure => 'installed'}
}
