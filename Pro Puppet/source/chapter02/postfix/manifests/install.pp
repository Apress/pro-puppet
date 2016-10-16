class postfix::install {
  package { [ "postfix", "mailx" ]:
    ensure => present,
  }
}
