class mysql::config {
  file { "/opt/csw/mysql5/my.cnf":
    ensure = > present,
    source => "puppet:///modules/mysql/my.cnf",
    owner => "mysql",
    group => "mysql",
    require => Class["mysql::install"],
    notify => Class["mysql::service"],
  }

  file { "/opt/csw/mysql5/var":
    group => "mysql",
    owner => "mysql",
    recurse => true,
    require => File["/opt/csw/mysql5/my.cnf"],
  }
}
