module Refactor
  class ExtractSuperclass < BaseRefactor

    def run    
      itens = Hash.new

      @first_klasses.each do |klass_v1|
        @second_klasses.each do |klass_v2|  
          if equal_klass klass_v1, klass_v2  

            dif_attr = (klass_v1.attributes - klass_v2.attributes)
            dif_meth = (klass_v1.methods - klass_v2.methods)

            parent = @second_klasses.select{ |item| dif_meth.included_in?(item.methods) && dif_attr.included_in?(item.attributes) && item.name == klass_v2.superclass.to_s}
            puts "Refactor ExtractSuperclass , A Classe #{klass_v2.name} começou a herdar a Classe #{parent.first.name}"
            
            @counter += 1
          end  
        end
      end
    end 

    def equal_klass klass_v1, klass_v2
      klass_v1.name == klass_v2.name && klass_v1.superclass != klass_v2.superclass
    end

  end
end