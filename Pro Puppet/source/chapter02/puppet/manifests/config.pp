class puppet::config {

include puppet::params

  file { "/etc/puppet/puppet.conf":
    ensure = > present,
    content => template("puppet/puppet.conf.erb"),
    owner => "puppet",
    group => "puppet",
    require => Class["puppet::install"],
    notify => Class["puppet::service"],
  }
}
