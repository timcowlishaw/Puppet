node default {
 include base
 include ssh
 include sudo
 include ruby
 include tim
}

node 'motueka' inherits default {
  include comms
  include rvm
  include x
  include audio
  include spotify
  include mysql
  include marblemouse
  include thinkpad-wifi
  include thinkpad-power
  include disable-bell
  include python-dev
  include netflix
  include virtualbox
  include rhythmbox
  include postgresql
  include postgis
  include printing
  include racket
  class {'ssd':
    device => "402be511-9f01-444f-978d-e5689bada738"
  }
  include synaptics
  include mendeley
  include shotwell
  include mongodb
  include elasticsearch
  include sun-java
  include wacom
  include redis
  include phantomjs
  include nodejs
  include ctags
  # include haskell
  # include sqlite
}
