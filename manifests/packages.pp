class rackmonkey::packages {
  $rm_packages = [
    "httpd",
    "sqlite",
    "perl-DBI",
    "perl-DBD-SQLite",
    "perl-HTML-Template",
    "perl-HTML-Parser",
  ]

  package { $rm_packages:
    ensure  => installed,
  }

}
