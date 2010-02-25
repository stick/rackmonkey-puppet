class rackmonkey::packages::postgres {
  package { "postgres-server":
    name  => "postgresql-server",
    ensure  => installed,
  }
}
