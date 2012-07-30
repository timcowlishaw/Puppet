class thinkpad-wifi {
  package {"firmware-iwlwifi": ensure => "installed"}
  package {"rfkill": ensure => "installed"}
  package {"wicd": ensure => "installed"}
  kmod::blacklist {"acer-wmi": }
  file {"/etc/rc.local.d/50-unblock-wifi":
    ensure => "present",
    source => "puppet:///modules/thinkpad-wifi/50-unblock-wifi",
    mode => "700"
  }
  Class["base"] -> Class["thinkpad-wifi"]
}
