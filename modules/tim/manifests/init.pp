class tim {
  user {"tim":
    ensure => present,
    shell  => "/bin/bash",
    groups => ["sudo","cdrom","floppy","audio","dip","video","plugdev"],
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

  file {"/home/tim/.bash_profile":
    content => template("tim/bash_profile.erb"),
    owner => "tim",
    group => "tim",
    mode => "640",
  }

  file {"/home/tim/.bashrc":
    source => "puppet:///modules/tim/bashrc",
    owner => "tim",
    group => "tim",
    mode => "640",
  }

  class { 'dropbox':
    user     => 'tim'
    dropbox_user     => hiera('username'),
    dropbox_password => hiera('password'),
  }

  Class['base'] -> Class['tim']
}
