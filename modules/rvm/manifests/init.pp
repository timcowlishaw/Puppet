class rvm {
  package {"openssl": ensure => "installed"}
  package {"libreadline6": ensure => "installed"}
  package {"libreadline6-dev": ensure => "installed"}
  package {"zlib1g": ensure => "installed"}
  package {"zlib1g-dev": ensure => "installed"}
  package {"libssl-dev": ensure => "installed"}
  package {"libyaml-dev": ensure => "installed"}
  package {"libsqlite3-0": ensure => "installed"}
  package {"libsqlite3-dev": ensure => "installed"}
  package {"sqlite3": ensure => "installed"}
  package {"libxml2-dev": ensure => "installed"}
  package {"libxslt-dev": ensure => "installed"}
  package {"autoconf": ensure => "installed"}
  package {"libc6-dev": ensure => "installed"}
  package {"ncurses-dev": ensure => "installed"}
  package {"automake": ensure => "installed"}
  package {"libtool": ensure => "installed"}
  package {"bison": ensure => "installed"}
  package {"subversion": ensure => "installed"}
  Class['ruby'] -> Class['rvm']
  Class['base'] -> Class['rvm']
}
