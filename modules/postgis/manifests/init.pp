class postgis {
  include prereq_packages
  include geos
  include proj
  include postgis2

  exec {'relink':
    command => "/sbin/ldconfig",
    require => Class["postgis::postgis2"]
  }

  Class['base'] -> Class['postgis']
  Class['postgresql'] -> Class['postgis']
}
