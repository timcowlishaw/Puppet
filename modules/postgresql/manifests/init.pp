class postgresql {
  package {'postgresql': ensure => 'installed'}
  package {'postgresql-client': ensure => 'installed'}
  package {'libpq-dev': ensure => 'installed'}
  augeas { "allow-postgres-login-without-unix-user-account":
    context => "/files/etc/postgresql/*/*/pg_hba.conf/*[type='local' and database='all' and user='all']",
    changes => [
      "set ./method md5"
    ],
    require => Package['postgresql']
  }
}
