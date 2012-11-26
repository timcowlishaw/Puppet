class postgis::prereq_packages {
  package { "g++": ensure => 'installed'}
  package { "swig": ensure => 'installed'}
  package { "swig2.0": ensure => 'installed'}
  package { "postgresql-server-dev-9.1": ensure => 'installed'}
  package { "libgdal1": ensure => 'installed'}
  package { "libgdal-dev": ensure => 'installed'}
}
