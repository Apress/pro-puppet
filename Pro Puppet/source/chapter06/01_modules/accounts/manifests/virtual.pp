class accounts::virtual {
  @user { "mysql":
    ensure => present,
    uid    => 27,
    gid    => 27,
    home   => "/var/lib/mysql",
    shell  => "/bin/bash",
  }
  @user { "apache":
    ensure => present,
    uid    => 48,
    gid    => "apache",
    home   => "/var/www",
    shell  => "/sbin/nologin",
  }
}
