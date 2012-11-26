class postgis::prereq_packages {
  package { "postgresql-server-dev-9.1": ensure => 'installed'}
  package { "libgdal1": ensure => 'installed'}
  package { "libgeos-c1": ensure => 'installed'}
  package { "libgdal-dev": ensure => 'installed'}
  package { "libgeos-dev": ensure => 'installed'}
}
