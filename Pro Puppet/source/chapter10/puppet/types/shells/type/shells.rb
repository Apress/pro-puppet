Puppet::Type.newtype(:shells) do
     @doc = "Manage the contents of /etc/shells
     shells { "/bin/newshell": 
                ensure => present, 
     }"

ensurable 

newparam(:shell) do  
  desc "The shell to manage" 
  isnamevar  
end     

newproperty(:target) do  
  desc "Location of the shells file"  
  defaultto { 
    if @resource.class.defaultprovider.ancestors.include? (Puppet::Provider::ParsedFile)           
      @resource.class.defaultprovider.default_target 
    else          
      nil         
  end
  }
 end
end 
