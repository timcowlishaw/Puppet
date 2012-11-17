class printing {
  package {"cups-client": ensure => "installed"}
  package {"avahi-daemon": ensure => "installed"}
  package {"avahi-discover": ensure => "installed"}
  package {"avahi-ui-utils": ensure => "installed"}
  package {"avahi-utils": ensure => "installed"}
  package {"cups": ensure => "installed"}
  package {"cups-pdf": ensure => "installed"}
  package {"hplip": ensure => "installed"}
  package {"libnss-mdns": ensure => "installed"}
  group {"lpadmin": ensure => "present"}
}
