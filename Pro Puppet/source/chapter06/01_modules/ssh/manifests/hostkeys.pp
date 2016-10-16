class ssh::hostkeys {
  # Export these resources into the configuration database.
  @@sshkey { "${fqdn}_dsa":
    host_aliases => [ "$fqdn", "$hostname", "$ipaddress" ],
    type         => dsa,
    key          => $sshdsakey,
  }
  @@sshkey { "${fqdn}_rsa":
    host_aliases => [ "$fqdn", "$hostname", "$ipaddress" ],
    type         => rsa,
    key          => $sshrsakey,
  }
}
