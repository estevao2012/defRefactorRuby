require 'fileutils' 

module Refactor
  class Version
    
    attr_accessor :folder_version, :klasses, :files
    
    def initialize folder_version
      @folder_version = folder_version  
      @files = []
      @klasses = []
      @path_files = []
      generate_temporary_files 
    end

    def generate_temporary_files
      rbfiles = File.join("#{@folder_version}/**", "*.rb")
      @files = Dir.glob(rbfiles) do |f|   

        dir, base = File.split(f)

        path = "/tmp/metricas-software/#{dir}"        
        path_file = "#{path}/#{base.sub!('.rb','')}.rb" 

        FileUtils.mkdir_p path
        tmp_file = File.new(path_file,"w+") 
        tmp_file.write(File.read(f))  
        tmp_file.close  

        @path_files << path_file 
      end  
    end  

    def load_klasses
      version   = "VersionOne" if File.new(@folder_version).path.split(File::SEPARATOR).last == "v1"
      version ||= "VersionTwo" 

      @path_files.each do |e|    
        klasses << Klass.new(e,version)
      end
    end

  end
end