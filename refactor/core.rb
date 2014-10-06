Dir["#{File.dirname(__FILE__)}/types/*.rb"].each {|file| require file }
module Refactor
  class Core    
    attr_accessor :version_path, :versions
    
    def initialize versions_path
      @version_path = versions_path
      @versions = get_versions
    end

    def get_versions
      Dir.glob("#{@version_path.path}/*").select {|f| File.directory? f}.map{ |version| Version.new version}
    end

    def run_parallel_versions  
      # move_method = MoveMethod.new versions.first.klasses, versions.last.klasses 
      MoveClass.new versions.first.klasses, versions.last.klasses 
      RenameClass.new versions.first.klasses, versions.last.klasses 
    end

  end
end