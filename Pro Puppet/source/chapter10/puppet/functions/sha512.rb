Puppet::Parser::Functions::newfunction(:sha512, :type => :rvalue, :doc => "Returns a SHA1 hash value from a provided string.") do |args|

  require 'sha1'

  Digest::SHA512.hexdigest(args[0])

end
