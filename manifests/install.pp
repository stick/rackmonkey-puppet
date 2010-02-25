class rackmonkey::install inherits rackmonkey::variables {
  include rackmonkey::packages
  include rackmonkey::services
  include rackmonkey::db
}
