class sun-java {
  file {"/tmp/sun-java6.preseed":
    ensure => "present",
    source => "puppet:///modules/sun-java/sun-java6.preseed"
  }

  package {"sun-java6-jdk":
    ensure => "installed",
    responsefile => "/tmp/sun-java6.preseed",
    require => File["/tmp/sun-java6.preseed"]
  }
}
