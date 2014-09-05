module Refactor
  class Version
    attr_accessor :folder_version
    def initialize folder_version
      @folder_version = folder_version
    end

    def get_files
      rbfiles = File.join("#{@folder_version}/**", "*.rb")
      Dir.glob(rbfiles) 
    end
  end
end