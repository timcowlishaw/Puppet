class postgis::proj {

  exec {'download-libproj':
    command => "/usr/bin/wget -O /tmp/proj-4.8.0.tar.gz http://download.osgeo.org/proj/proj-4.8.0.tar.gz",
    unless => "/usr/bin/test -f /usr/local/lib/libproj.so.0"
  }

  exec {'extract-libproj':
    cwd => "/tmp",
    command => "/bin/tar -xzvf /tmp/proj-4.8.0.tar.gz",
    require => Exec['download-libproj'],
    unless => "/usr/bin/test -f /usr/local/lib/libproj.so.0",
  }

  exec {'configure-make-make-install-libproj':
    cwd => "/tmp/proj-4.8.0",
    command => "/tmp/proj-4.8.0/configure && /usr/bin/make && /usr/bin/make install",
    require => Exec['extract-libproj'],
    unless => "/usr/bin/test -f /usr/local/lib/libproj.so.0",
  }

  Class["postgis::geos"] -> Class["postgis::proj"]
}
