class postgis::postgis2 {

  exec {'download-postgis':
    command => "/usr/bin/wget -O /tmp/postgis-2.0.0.tar.gz http://postgis.refractions.net/download/postgis-2.0.0.tar.gz",
    unless => "/usr/bin/test -f /usr/local/lib/liblwgeom.so"
  }

  exec {'extract-postgis':
    cwd => "/tmp",
    command => "/bin/tar -xzvf /tmp/postgis-2.0.0.tar.gz",
    require => Exec['download-postgis'],
    unless => "/usr/bin/test -f /usr/local/lib/liblwgeom.so"
  }

  exec {'configure-make-make-install-postgis':
    cwd => "/tmp/postgis-2.0.0",
    command => "/tmp/postgis-2.0.0/configure && /usr/bin/make && /usr/bin/make install && /usr/bin/make comments-install",
    require => Exec['extract-postgis'],
    unless => "/usr/bin/test -f /usr/local/lib/liblwgeom.so"
  }

  Class["postgis::proj"] -> Class["postgis::postgis2"]
}
