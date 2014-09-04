require "#{File.dirname(__FILE__)}/refactor/core.rb" 

class Main
  include Refactor

  def self.run folder
    folder = File.new(folder) 
    versions = folder.path+"/versions/"
    Core.init versions
  end
end
