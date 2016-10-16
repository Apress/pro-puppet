Facter.add("home") do
       setcode do
           ENV['HOME']
       end
end
