class rackmonkey::services::mysql {
  service { "mysql-server":
    name  => "mysqld",
    ensure  => running,
    enable  => true,
    require   => Class["rackmonkey::packages::mysql"],
  }
}
