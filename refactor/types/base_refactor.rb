module Refactor
  class BaseRefactor 
    attr_accessor :first_klasses, :second_klasses, :counter 

    def initialize first_klasses, second_klasses
      @first_klasses = first_klasses
      @second_klasses = second_klasses
      @counter = 0
      self.processa_refactor
    end

    def processa_refactor
      self.run 
      puts "Total refactors #{Klass.name_klass(self.class)}: #{@counter}"
    end 

    def mensagem_sucesso v1, v2, custom, type
      "Refactor #{type} #{custom} #{v1} to #{v2}"
    end
  end 
end