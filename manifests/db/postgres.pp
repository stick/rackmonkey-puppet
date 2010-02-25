class rackmonkey::db::postgres {
  Exec {
    refreshonly   => true,
  }

  exec {
    "create-user":
      command   => "/usr/bin/createuser --no-superuser --no-createdb --no-createrole ${rm_db_user}",
      before  => Exec["create-db"],
    ;
    "create-db":
      command   => "/usr/bin/createdb --owner ${rm_db_user} ${rm_db_name}",
      before  => Exec["load-schema"],
    ;
    "load-schema":
      command   => "/usr/bin/psql -U ${rm_db_user} ${rm_db_name} < ${rm_doc_loc}/schema/schema.postgres.sql",
      before  => Exec["load-default-data"],
    ;
    "load-default-data":
      command   => "/usr/bin/psql -U ${rm_db_user} ${rm_db_name} < ${rm_doc_loc}/data/default_data.sql",
      before  => Exec["load-sample-data"],
    ;
    "load-sample-data":
      command   => "/usr/bin/psql -U ${rm_db_user} ${rm_db_name} < ${rm_doc_loc}/data/sample_data.sql",
    ;
  }
}
