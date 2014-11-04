Dir["#{File.dirname(__FILE__)}/types/*.rb"].each {|file| require file }
module Refactor
  class Core    
    attr_accessor :versions
    
    def initialize versions_path 
      FileUtils.mkdir_p '/tmp/metricas-software' 
      @versions = Dir.glob("#{versions_path.path}/*").select {|f| File.directory? f}.map{ |version| Version.new version} 
    end

    def run_parallel_versions  
      # move_method = MoveMethod.new versions.first.klasses, versions.last.klasses 
      move_field = MoveField.new versions.last.klasses, versions.first.klasses 
      # move_class = MoveClass.new versions.first.klasses, versions.last.klasses 
      # rename_class = RenameClass.new versions.first.klasses, versions.last.klasses 
    end

  end
end