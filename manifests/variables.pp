class rackmonkey::variables {
  $rm_varroot = "/var/lib/rackmonkey"
  $rm_conffile = "/etc/rackmonkey/rackmonkey.conf"
  $rm_db_name = "rackmonkey"
  $rm_tmplpath = "${rm_varroot}/tmpl"
  $rm_wwwpath = "/inventory"
  $rm_wwwroot = "/var/www/rackmonkey"
  $rm_doc_loc = "/usr/share/doc/rackmonkey-1.2.5"
  $rm_db_type = "sqlite" # sqlite || mysql || postgres

  # sqlite only
  $rm_dbfile = "${rm_varroot}/${rm_db_name}.db"

  # These are only needed if you are using a db other than sqlite
  $rm_db_user = ""
  $rm_db_pass = ""
  $rm_db_hostname = ""
  $rm_db_port = ""

  # Generally don't need to set anything below here
  case $rm_db_type {
    sqlite: {
      $rm_db_connect_string = "dbi:SQLite:dbname=${rm_dbfile}"
    }
    mysql: {
      $rm_db_connect_string = "dbi:mysql:dbname=${rm_db_name}"
    }
    postgres: {
      $rm_db_connect_string = "dbi:Pg:dbname=${rm_db_name}"
    }
  }

  if $rm_db_hostname {
    $rm_db_connect_string += ";host=${rm_db_hostname}"
  }

  if $rm_db_port {
    $rm_db_connect_string += ";port=${rm_db_port}"
  }

}
