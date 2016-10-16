Before do
  # local configuration
  # @confdir = File.join(File.dirname(__FILE__), '..', '..')
  @confdir = "/etc/puppet"
  # @manifest = File.join(@confdir, 'manifests', 'site.pp')
  @manifest = "/etc/puppet/manifests/site.pp"
  # adjust facts like this
  @facts['architecture'] = "i386"
end
