class pache::account($ensure=present) {
  user { 'apache':
    ensure => $ensure,
    gid    => 48,
  }
  group { 'apache':
    ensure => $ensure,
    gid    => 48,
  }

  # Resource Chaining inside of a conditional
  if ($ensure == present) {
    Group['apache'] -> User['apache']
  } else {
    User['apache'] -> Group['apache']
  }

}
