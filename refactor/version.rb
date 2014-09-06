module Refactor
  class Version
    
    attr_accessor :folder_version
    
    def initialize folder_version
      @folder_version = folder_version
    end

    def files
      rbfiles = File.join("#{@folder_version}/**", "*.rb")
      files = Dir.glob(rbfiles).map{ |f| Klass.new f}
      files
    end

  end
end