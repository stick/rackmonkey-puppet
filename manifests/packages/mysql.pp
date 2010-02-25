class rackmonkey::packages::mysql {
  package { "mysql-server":
    ensure  => installed,
  }
}
