module Refactor
  class MoveClass < BaseRefactor

    def run  
      @first_klasses.each do |klass_v1|  
        @second_klasses.each do |klass_v2|
          if filter klass_v1, klass_v2
            puts "Refactor MoveClass #{klass_v1.klass} to #{klass_v2.klass}"
            @counter+=1
          end
        end
      end 
    end 

    private 
    
    def filter klass_v1, klass_v2 
      return same_class(klass_v1,klass_v2) && klass_v1.parent != klass_v2.parent
    end

    def same_class klass_v1, klass_v2 
      klass_v1.all_methods_of_klass == klass_v2.all_methods_of_klass && klass_v1.klass.attributes == klass_v2.klass.attributes && klass_v1.name_klass == klass_v2.name_klass
    end
  end
end
