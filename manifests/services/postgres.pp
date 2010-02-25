class rackmonkey::services::postgres {
  service { "postgres-server":
    name  => "postgresql",
    ensure  => running,
    enable  => true,
    require   => Class["rackmonkey::packages::postgres"],
  }
}
