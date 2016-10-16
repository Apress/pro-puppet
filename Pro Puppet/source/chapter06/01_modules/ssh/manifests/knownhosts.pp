# Collect all exported resources.
# Include this class on any system that should have
# all of the known hosts of every other system.
class ssh::knownhosts {
  Sshkey <<| |>> { ensure => present }
}

