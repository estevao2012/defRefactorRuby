require 'fileutils'
module Refactor
  class Version
    
    attr_accessor :folder_version, :klasses
    
    def initialize folder_version
      @folder_version = folder_version  
      @klasses = generate_klasses
    end

    def generate_klasses
      rbfiles = File.join("#{@folder_version}/**", "*.rb")
      path_files = []

      files = Dir.glob(rbfiles).map do |f|   

        dir, base = File.split(f)

        path = "/tmp/metricas-software/#{dir}"        
        path_file = "#{path}/#{base.sub!('.rb','')}.rb"
        
        version = "VersionOne" if File.new(@folder_version).path.split(File::SEPARATOR).last == "v1"  
        version = "VersionTwo" unless File.new(@folder_version).path.split(File::SEPARATOR).last == "v1" 

        code_string = "module #{version}\n #{File.read(f)}\nend"   

        FileUtils.mkdir_p path
        tmp_file = File.new(path_file,"w+") 
        tmp_file.write(code_string)  
        tmp_file.close  

        path_files << path_file
        load File.new path_file 
      end  
      klassess = []
      path_files.each do |e| 
        klassess << Klass.new(e)
      end
      

      return klassess
    end
  end
end