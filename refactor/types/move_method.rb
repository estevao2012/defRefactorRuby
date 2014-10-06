module Refactor
  class MoveMethod

    attr_accessor :first_klasses, :second_klasses

    def initialize first_klasses, second_klasses
      @first_klasses = first_klasses
      @second_klasses = second_klasses
      self.run
    end

    def run 
      @first_klasses.each do |klass_v1|    
        @second_klasses.each do |klass_v2|
          puts klass_v1.klass.instance_methods(false) & klass_v2.klass.instance_methods(false)
          puts klass_v1.klass.singleton_methods(false) & klass_v2.klass.singleton_methods(false)
        end
      end
    end
  end
end