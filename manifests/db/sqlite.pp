class rackmonkey::db::sqlite {
  file { "rackmonkey.db":
    name  => $rm_dbfile,
    ensure  => present,
    owner   => apache,
    group   => apache,
    require   => Exec["create-db"],
    mode  => 0644,
  }

  Exec {
    refreshonly   => true,
  }

  exec {
    "create-db":
      command   => "/usr/bin/sqlite3 ${rm_dbfile} < ${rm_doc_loc}/schema/schema.${rm_dbtype}.sql",
      before  => Exec["load-default-data"],
      creates   => $rm_dbfile,
    ;
    "load-default-data":
      command   => "/usr/bin/sqlite3 ${rm_dbfile} < ${rm_doc_loc}/data/default_data.sql",
      before  => Exec["load-sample-data"],
    ;
    "load-sample-data":
      command   => "/usr/bin/sqlite3 ${rm_dbfile} < ${rm_doc_loc}/data/sample_data.sql",
    ;
  }
}
