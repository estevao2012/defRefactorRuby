module Refactor
  class Core
    
    attr_accessor :version_path
    
    def initialize versions
      @version_path = versions 
    end

    def versions
      Dir.glob("#{@version_path.path}/*").select {|f| File.directory? f}.map{ |version| Version.new version}
    end

  end
end