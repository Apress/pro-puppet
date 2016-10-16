# Message of the Day class implemented in the Ruby DSL
hostclass :motd_location do

  # Lookup the enc_location parameter set by the ENC
  # Assign it to the location variable in Ruby
  location = scope.lookupvar("enc_location")
  # Set a Ruby String variable to represent the contents
  # of the message of the day file
  motd_content = "This system is in: #{location}\n"

  # Declare a file resource using Ruby syntax
  # This is equivalent to the Puppet Syntax:
  # file { motd:
  #   ensure  => "file",
  #   path    => "/etc/motd",
  #   content => $motd_content,
  #   owner   => 0,
  #   group   => 0,
  #   mode    => 0644,
  # }
  file("motd",
    :ensure  => "file",
    :path    => "/etc/motd",
    :content => motd_content,
    :owner   => 0,
    :group   => 0,
    :mode    => 0644)

end

