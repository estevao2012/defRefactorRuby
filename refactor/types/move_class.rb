module Refactor
  class MoveClass
    attr_accessor :first_klasses, :second_klasses


    def initialize first_klasses, second_klasses
      @first_klasses = first_klasses
      @second_klasses = second_klasses
      self.run
    end

    def run 
      @first_klasses.each do |klass_v1|  
        @second_klasses.each do |klass_v2|
          if klass_v1.klass.methods == klass_v2.klass.methods && klass_v1.klass.parent != klass_v2.klass.parent && klass_v1.klass.new.instance_variables == klass_v2.klass.new.instance_variables  && klass_v1.klass.name.split('::').last == klass_v2.klass.name.split('::').last
            puts "Refactor MoveClass #{klass_v1.klass} to #{klass_v2.klass}"
          end
        end
      end
    end

  end
end
