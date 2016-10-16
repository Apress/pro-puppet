class mysql::service {
  service { "cswmysql5":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enabled => true,
    require => Class["mysql::config"],
  }
}
