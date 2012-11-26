class postgis {

  include prereq_packages
  include proj
  include postgis2

  Class['base'] -> Class['postgis']
  Class['postgresql'] -> Class['postgis']
}
