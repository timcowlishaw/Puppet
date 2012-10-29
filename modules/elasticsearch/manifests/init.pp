class elasticsearch {

  exec {"get-elasticsearch-deb":
    command => "/usr/bin/wget -O /tmp/elasticsearch.deb \"https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-0.19.11.deb\"",
    unless => "/usr/bin/dpkg -s elasticsearch"

  }

  package {"elasticsearch":
    provider => "dpkg",
    ensure => "installed",
    source => "/tmp/elasticsearch.deb",
    require => Exec["get-elasticsearch-deb"]
  }

  Class['base'] -> Class['elasticsearch']
}
