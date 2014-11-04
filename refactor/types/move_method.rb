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

          if filter_klass klass_v1, klass_v2

            klass_v1.all_methods_of_klass.each do |method_v1|
              klass_v2.all_methods_of_klass.each do |method_v2|

                if filter_method klass_v1.method(method_v1), klass_v2.method(method_v2)

                end
                
              end
            end   
          end
        end
      end
    end

    private 

    def filter_klass klass_v1, klass_v2
      klass_v1.name != klass_v2.name
    end

    def filter_method method_v1, method_v2
      method_v1
    end

  end
end