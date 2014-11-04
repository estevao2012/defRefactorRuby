module Refactor
  class RenameClass < BaseRefactor  

    def run        
      @first_klasses.each do |klass_v1|  
        @second_klasses.each do |klass_v2| 
          if filter klass_v1, klass_v2
            puts "Refactor RenameClass #{klass_v1.klass} to #{klass_v2.klass}"
            @counter += 1
          end
        end
      end 
    end 

    def filter klass_v1, klass_v2
      same_class(klass_v1,klass_v2) && klass_v1.name_klass != klass_v2.name_klass
    end

    def same_class klass_v1, klass_v2
      klass_v1.all_methods_of_klass == klass_v2.all_methods_of_klass && klass_v1.klass.attributes == klass_v2.klass.attributes && klass_v1.parent == klass_v2.parent
    end

  end
end
