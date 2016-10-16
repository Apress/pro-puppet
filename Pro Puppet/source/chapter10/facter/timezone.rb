Facter.add("timezone") do
       setcode do
         if Facter.value(:operatingsystem) =~ /Debian|Ubuntu/
            File.readlines("/etc/timezone").to_a.last
         else
            tz = Time.new.zone
         end 
       end 
end
