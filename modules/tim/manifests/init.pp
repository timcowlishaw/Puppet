class tim {
  user {"tim":
    ensure => present,
    shell  => "/bin/bash",
    groups => ["sudo","cdrom","floppy","audio","dip","video","plugdev", "dropbox"],
    home => "/home/tim",
    managehome => "true",
  }

  if $hostname == "motueka" {
    $prompt_colour_1 = 'R'
    $prompt_colour_2 = 'C'
  } elsif $hostname == "riwaka" {
    $prompt_colour_1 = 'R'
    $prompt_colour_2 = 'M'
  } elsif $hostname == "kohatu" {
    $prompt_colour_1 = 'B'
    $prompt_colour_2 = 'C'
  } else {
    $prompt_colour_1 = 'W'
    $prompt_colour_2 = 'W'
  }

  file {"/home/tim/.host_prompt_colours":
    content => template("tim/host_prompt_colours.erb"),
    owner => "tim",
    group => "tim",
    mode => "640",
  }

  #class { 'dropbox':
  #  user     => 'tim',
  #  dropbox_user     => hiera('username'),
  #  dropbox_password => hiera('password'),
  #}

  Class['base'] -> Class['tim']
}
