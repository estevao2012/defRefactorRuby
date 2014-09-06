require 'active_support'
require 'active_support/dependencies'

Dir["#{File.dirname(__FILE__)}/refactor/*.rb"].each {|file| require file }

class Main
  include Refactor 

  def self.run folder
    versions = File.new("#{File.dirname(__FILE__)}/toys/#{folder}/versions/")  
    refactor = Core.new versions  
    obj_file = refactor.versions.last.files.last
    obj_file.klass
  end

end
