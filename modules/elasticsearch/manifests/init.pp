class elasticsearch {

  exec {"get-elasticsearch-deb":
    command => "/usr/bin/wget -O /tmp/elasticsearch.deb \"https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.6.deb\"",
    unless => "/usr/bin/dpkg -s elasticsearch | grep installed"

  }

  package {"elasticsearch":
    provider => "dpkg",
    ensure => "installed",
    source => "/tmp/elasticsearch.deb",
    require => Exec["get-elasticsearch-deb"]
  }

  Class['base'] -> Class['elasticsearch']
}
