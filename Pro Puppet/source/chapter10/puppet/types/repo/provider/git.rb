require 'fileutils'
Puppet::Type.type(:repo).provide(:git) do

  desc "Provides Git support for the repo provider"

  commands :gitcmd => "git"

  def create         
    gitcmd "clone", resource[:name], resource[:path]
  end

  def destroy
    FileUtils.rm_rf resource[:path]
  end

  def exists?
    File.directory? resource[:path]
  end 

end
