module Refactor
  class MoveClass < BaseRefactor

    def run  
      @first_klasses.each do |klass_v1|  
        @second_klasses.each do |klass_v2|
          if filter klass_v1, klass_v2
            puts "Refactor MoveClass #{klass_v1.name} to #{klass_v2.name}"
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
      klass_v1.methods == klass_v2.methods && klass_v1.attributes == klass_v2.attributes && klass_v1.name_klass == klass_v2.name_klass
    end
  end
end
