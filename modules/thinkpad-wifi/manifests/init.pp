class thinkpad-wifi {
  package {"firmware-iwlwifi": ensure => "installed"}
  package {"rfkill": ensure => "installed"}
  package {"wicd": ensure => "installed"}
}
