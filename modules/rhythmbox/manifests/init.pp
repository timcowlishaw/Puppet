class rhythmbox {
  package {"rhythmbox": ensure => "installed"}
  package {"rhythmbox-plugins": ensure => "installed"}
  Class["base"] -> Class["rhythmbox"]
  Class["audio"] -> Class["rhythmbox"]
  Class["x"] -> Class["rhythmbox"]
}
