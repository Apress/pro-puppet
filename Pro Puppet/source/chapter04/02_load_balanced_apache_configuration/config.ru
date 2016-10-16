# /etc/puppet/rack/puppetmaster/config.ru
#
# This configuration is valid for Puppet 2.6
# Puppet 2.7 and later may require slightly different rack
# configuration.  Please see docs.puppetlabs.com for up to date
# information.
#
# a config.ru, for use with every rack-compatible webserver.
$0 = "master"
# if you want debugging, uncomment the next line
# ARGV << "--debug"
ARGV << "--rack"
require 'puppet/application/master'
run Puppet::Application[:master].run
# EOF /etc/puppet/rack/puppetmaster/config.ru
