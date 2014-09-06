module Refactor
  class Klass
    attr_accessor :file, :klass

    def initialize file
      @file = File.new file 
      require @file
      file_name = File.basename(@file.path, '.rb')
      @klass = file_name.camelize.constantize
    end  
  end
end