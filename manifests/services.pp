class rackmonkey::services {
  Service {
    hasrestart => true,
    hasstatus => true,
    enable  => true,
    ensure  => running,
  }

  service {
    "httpd":
      restart   => "/sbin/service httpd graceful",
    ;
  }

  include "rackmonkey::services::${rm_db_type}"
}
