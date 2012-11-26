class postgis::geos {


  exec {'download-geos':
    command => "/usr/bin/wget -O /tmp/geos-3.3.3.tar.bz2 http://download.osgeo.org/geos/geos-3.3.3.tar.bz2",
    unless => "/usr/bin/test -f /usr/local/lib/libgeos-3.3.3.so",
  }

  exec {'extract-geos':
    cwd => "/tmp",
    command => "/bin/tar -xjvf /tmp/geos-3.3.3.tar.bz2",
    require => Exec['download-geos'],
    unless => "/usr/bin/test -f /usr/local/lib/libgeos-3.3.3.so",
  }

  exec {'configure-make-make-install-geos':
    cwd => "/tmp/geos-3.3.3",
    command => "/tmp/geos-3.3.3/configure --enable-ruby --prefix=/usr/local && /usr/bin/make && /usr/bin/make install",
    require => Exec['extract-geos'],
    unless => "/usr/bin/test -f /usr/local/lib/libgeos-3.3.3.so",
    timeout => 0
  }
  Class["postgis::prereq_packages"] -> Class["postgis::geos"]

}
