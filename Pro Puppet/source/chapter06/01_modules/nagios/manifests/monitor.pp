# Manage the Nagios monitoring service
class nagios::monitor {
  # Manage the packages
  package { [ "nagios", "nagios-plugins" ]:
    ensure => installed
  }
  # Manage the Nagios monitoring service
  service { "nagios":
    ensure    => true,
    hasstatus => true,
    enable    => true,
    subscribe => [ Package["nagios"], Package["nagios-plugins"] ],
  }

  # collect resources and populate /etc/nagios/nagios_*.cfg
  Nagios_host <<||>> { notify => Service["nagios"] }
  Nagios_service <<||>> { notify => Service["nagios"] }
}
