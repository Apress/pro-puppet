require 'puppet'

Puppet::Reports.register_report(:summary) do

  desc <<-DESC
  Send summary report information to the report directory."
  DESC

  def process
    client = self.host
    summary = self.summary
    dir = File.join(Puppet[:reportdir], client)
    client = self.host
    file = "summary.txt"
    destination = File.join(dir, file)
    File.open(destination,"w") do |f|
      f.write(summary)
    end
  end
end
