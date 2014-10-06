module Refactor
  class RenameClass
    attr_accessor :first_klasses, :second_klasses


    def initialize first_klasses, second_klasses
      @first_klasses = first_klasses
      @second_klasses = second_klasses
      self.run
    end

    def run 
      @first_klasses.each do |klass_v1|  
        @second_klasses.each do |klass_v2| 
          if filter klass_v1, klass_v2
            puts "Refactor Rename #{klass_v1.klass} to #{klass_v2.klass}"
          end
        end
      end
    end

    def name_klass klass
      klass.name.split('::').last
    end

    def filter klass_v1, klass_v2
      klass_v1.klass.methods == klass_v2.klass.methods && klass_v1.klass.parent == klass_v2.klass.parent && klass_v1.klass.new.instance_variables == klass_v2.klass.new.instance_variables && name_klass(klass_v1.klass) != name_klass(klass_v2.klass) && klass_v1.filename == klass_v2.filename
    end

  end
end
