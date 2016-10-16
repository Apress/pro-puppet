# Define a new accounts_ruby class.  This is equivalent to:
# class accounts_ruby { ... }
hostclass :accounts_ruby do

  # Bring the accounts resources defined in the ENC into a local
  # Ruby variable.
  accounts = scope.lookupvar("account_resources")

  # Perform a sanity check on the data provided by the ENC.
  raise Puppet::Error,
    "account_resources must be a Hash" unless accounts.kind_of?(Hash)

  # First declare groups required by the accounts.  These groups may be
  # referenced in /etc/sudoers to grant sudo access and access without
  # a password entry.
  group([:sudo, :sudo_nopw], :ensure => "present")

  # Iterate over each account
  # The Hash key will be stored in the local title variable
  # The value of the hash entry will be stored in parameters
  # The parameters are the resource parameters for each user account.
  accounts.each do |title, parameters|

    # Some more sanity checking on the data passed in from the ENC.
    raise Puppet::Error,
      "account_resources[#{title}] must be a Hash" unless parameters.kind_of?(Hash)

    # Manage the home directory of this account with a file resource.
    file(parameters["home"],
         :ensure => "directory",
         :owner  => title,
         :group  => title,
         :mode   => 0700)

    # Each account should have a group of the same name.
    group(title,
          :ensure => "present",
          :gid    => parameters["gid"])

    # Declare the user resource with the parameters for this account.
    user(title,
         :ensure     => "present",
         :uid        => parameters["uid"],
         :gid        => parameters["gid"],
         :comment    => parameters["comment"],
         :groups     => parameters["groups"],
         :shell      => parameters["shell"],
         :password   => parameters["password"],
         :home       => parameters["home"],
         :managehome => false)

  end

end

