module Refactor
  class Core
    attr_accessor :version_path, :versions
    def initialize versions
      @version_path = versions
      @versions = get_versions
    end

    def get_versions
      Dir.glob("#{@version_path.path}/*").select {|f| File.directory? f}.map{ |version| Version.new version}
    end
  end
end