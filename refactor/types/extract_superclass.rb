module Refactor
  class ExtractSuperclass < BaseRefactor

    def run   
      removed = Hash.new
      added = Hash.new

      @first_klasses.each do |klass_v1|
        @second_klasses.each do |klass_v2|  
          if equal_klass klass_v1, klass_v2
            added[klass_v1.name] = klass_v2.klass.parents - klass_v1.klass.parents if (klass_v2.klass.parents - klass_v1.klass.parents) != []
            removed[klass_v2.name] = klass_v1.klass.parents - klass_v2.klass.parents if (klass_v1.klass.parents - klass_v2.klass.parents) != []
          end 
        end
      end

      removed.each do |i_removed, single_removed|
        added.each do |i_add, single_add|
          single_removed.each do |attrb|
            if single_add.select{|e| e == attrb} != []
              puts mensagem_sucesso i_removed, i_add, "Campo #{attrb}", "MoveField" 
            end
          end        
        end
      end

      puts removed
      puts added
    end 

    def filter klass_v1, klass_v2 
    end

    def equal_klass klass_v1, klass_v2
      klass_v1.name == klass_v2.name 
      # p klass_v1
      # p klass_v2
    end

  end
end