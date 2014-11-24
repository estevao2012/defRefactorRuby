require 'require_all'
require "#{File.dirname(__FILE__)}/types/base_refactor"
Dir["#{File.dirname(__FILE__)}/types/*.rb"].each {|file| require file } 



module Refactor
  class Core    
    attr_accessor :versions
    
    def initialize versions_path 
      FileUtils.mkdir_p '/tmp/metricas-software'
      @versions = Dir.glob("#{versions_path.path}/*").select {|f| File.directory? f}.map{ |version| Version.new version} 
      @versions.each do |version|
        version.load_klasses
      end
    end

    def run_parallel_versions  
      # p versions.last.klasses
      puts "-- Move Method --"
      move_method = MoveMethod.new versions.last.klasses, versions.first.klasses 
      puts "-- Move Field --"
      move_field = MoveField.new versions.last.klasses, versions.first.klasses 
      puts "-- Move Class -- "
      move_class = MoveClass.new versions.last.klasses, versions.first.klasses 
      puts "-- Rename Class"
      rename_class = RenameClass.new versions.last.klasses, versions.first.klasses 
      puts "-- ExtractSuperclass --"
      extractsuperclass_method = ExtractSuperclass.new versions.last.klasses, versions.first.klasses 
      # puts "-- Extract Method --"
      # extract_method = ExtractMethod.new versions.last.klasses, versions.first.klasses 
      puts "-- Estatisticas --"


      move_method.estatisticas
      move_field.estatisticas
      move_class.estatisticas
      rename_class.estatisticas
      extractsuperclass_method.estatisticas 
    end

  end
end