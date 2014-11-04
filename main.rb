require 'active_support'
require 'active_support/dependencies'
require 'method_source'

Dir["#{File.dirname(__FILE__)}/refactor/*.rb"].each {|file| require file }

class Main
  include Refactor 
 
  def self.run folder
    versions = File.new("#{File.dirname(__FILE__)}/toys/#{folder}/versions/")  
    core_versions = Core.new versions  
    core_versions.run_parallel_versions 
  end
end

Main.run 'teste'
