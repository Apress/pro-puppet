#!/usr/bin/env ruby
#

# Load the YAML library in ruby.  Provide the to_yaml method for all
# Ruby objects.
require 'yaml'

# The output hash.  Must contain the "parameters" and "classes" key.
# See: http://docs.puppetlabs.com/guides/external_nodes.html
@out = Hash.new

# Output Array of classes, Hash of Parameters
@out["classes"]    = Array.new
@out["parameters"] = Hash.new

# Add the motd_location class to the catalogs
@out["classes"] << "motd_location"
# And, add the accounts_ruby class to the catalog
@out["classes"] << "accounts_ruby"

# Add a location parameter
@out["parameters"]["enc_location"] = "Florida"

# Store account information dynamically in the account_resources
# parameter.  These values could come from LDAP, SQL, etc...
@out["parameters"]['account_resources'] = Hash.new

# @out["parameters"]['account_resources']["localadmin"] = {
#   "comment"  => "Local Administrator",
#   "home"     => "/home/localadmin",
#   "uid"      => 600,
#   "gid"      => 600,
#   "groups"   => [ "sudo", "sudo_nopw", "ops" ],
#   "shell"    => "/bin/bash",
#   "password" => "!!",
# }

@out["parameters"]['account_resources']["alice"] = {
  "comment"  => "Alice",
  "home"     => "/home/alice",
  "uid"      => 601,
  "gid"      => 601,
  "groups"   => [ "sudo", "sudo_nopw", "devel" ],
  "shell"    => "/bin/bash",
  "password" => "!!",
}

@out["parameters"]['account_resources']["bob"] = {
  "comment"  => "Bob",
  "home"     => "/home/bob",
  "uid"      => 602,
  "gid"      => 602,
  "groups"   => [ "sudo", "sudo_nopw", "ops" ],
  "shell"    => "/bin/zsh",
  "password" => "!!",
}

puts @out.to_yaml

