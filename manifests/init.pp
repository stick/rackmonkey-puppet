class rackmonkey inherits rackmonkey::variables {
  file {
    "rackmonkey.conf":
      name  => $rm_conffile,
      owner   => root,
      group   => root,
      mode  => 0644,
      content   => template("rackmonkey/rackmonkey.conf"),
    ;
    "httpd-rackmonkey.conf":
      name  => "/etc/httpd/conf.d/rackmonkey.conf",
      owner   => root,
      group   => root,
      mode  => 0644,
      content   => template("rackmonkey/httpd-rackmonkey.conf"),
    ;
  }
}

class rackmonkey::variables {
  $rm_varroot = "/var/lib/rackmonkey"
  $rm_conffile = "/etc/rackmonkey/rackmonkey.conf"
  $rm_dbfile = "${rm_varroot}/rackmonkey.db"
  $rm_tmplpath = "${rm_varroot}/tmpl"
  $rm_wwwpath = "/inventory"
  $rm_wwwroot = "/var/www/rackmonkey"
}

