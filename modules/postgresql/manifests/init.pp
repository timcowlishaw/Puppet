class postgresql {
  package {'postgresql': ensure => 'installed'}
  package {'postgresql-client': ensure => 'installed'}
  package {'libpq-dev': ensure => 'installed'}
}
