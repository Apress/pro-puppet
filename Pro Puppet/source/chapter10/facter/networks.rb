netname = nil
netaddr = nil
test = {}

  File.open("/etc/networks").each do |line|
    netname = $1 and netaddr = $2 if line =~ /^(\w+.?\w+)\s+([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)/
    if netname != nil && netaddr != nil
      test["network_" + netname] = netaddr
      netname = nil
      netaddr = nil
    end
  end
  
  test.each { |name,fact|
    Facter.add(name) do
      setcode do
        fact
      end
    end
  }
