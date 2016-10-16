class ssh::service {
  service { $ssh::params::ssh_service_name:
    ensure => running,
    hasstatus => true,
    hasresstart => true,
    enable => true,
    require => Class["ssh::config"],
  }
}
