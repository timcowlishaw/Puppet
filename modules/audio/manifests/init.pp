class audio {
  package {"alsa-base": ensure => "installed"}
  package {"alsa-utils": ensure => "installed"}
  package {"alsa-tools": ensure => "installed"}
  package {"volumeicon-alsa": ensure => "installed"}
}
