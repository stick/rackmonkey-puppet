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
      notify  => Service["httpd"],
    ;
  }
}
