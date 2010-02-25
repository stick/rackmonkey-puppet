class rackmonkey::db::mysql {
  # admittedly this is a bit ugly
  $grant_statement = "GRANT ALL ON ${rm_db_name}.* TO '${rm_db_user}'@'%' IDENTIFIED BY '${rm_db_pass}';"

  Exec {
    refreshonly   => true,
  }

  exec {
    "create-db":
      command   => "/usr/bin/mysqladmin create ${rm_db_name}",
      refreshonly   => true,
      before  => Exec["load-schema"],
    ;
    "load-schema":
      command   => "/usr/bin/mysql ${rm_db_name} < ${rm_doc_loc}/schema/schema.mysql.sql",
      refreshonly   => true,
      before  => Exec["load-default-data"],
    ;
    "load-default-data":
      command   => "/usr/bin/mysql ${rm_db_name} < ${rm_doc_loc}/data/default_data.sql",
      refreshonly   => true,
      before  => Exec["load-sample-data"],
    ;
    "load-sample-data":
      command   => "/usr/bin/mysql ${rm_db_name} < ${rm_doc_loc}/data/sample_data.sql",
      refreshonly   => true,
      before  => Exec["create-user-grant"]
    ;
    "create-user-grant":
      command   => "/usr/bin/mysql ${rm_db_name} -e \"${grant_statement}\"",
      refreshonly   => true,
    ;
  }
}
