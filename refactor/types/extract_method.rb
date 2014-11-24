module Refactor
  class ExtractMethod < BaseRefactor
    
    def run    

      @first_klasses.each do |klass_v1|
        @second_klasses.each do |klass_v2|  
          if equal_klass klass_v1, klass_v2  

            dif_meth = (klass_v2.methods - klass_v1.methods)

            p dif_meth

            
            @counter += 1
          end  
        end
      end
    end 

    def equal_klass klass_v1, klass_v2
      klass_v1.name == klass_v2.name
    end

  end
end