class rackmonkey::services {
  service { "httpd":
    ensure  => running
    hasrestart => true,
    hasstatus => true,
  }
}
