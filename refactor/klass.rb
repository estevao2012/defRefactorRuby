module Refactor
  class Klass
    attr_accessor :klass, :stringfile, :filename

    def initialize file  
      load File.new file
      dir, base = File.split(file)
      @filename = base

      tmp_module = Module.dup 
      tmp_module.class_eval File.read(file)  
 
      class_or_module = tmp_module.const_get( get_class_or_module(tmp_module).first ) 
      obj = get_class class_or_module  
      @klass = eval(obj.name.split("::")[1..100].join("::"))

    end  

    def get_class_or_module tmp_module
      tmp_module.constants.select {|c| (tmp_module.const_get(c).is_a? Class or tmp_module.const_get(c).is_a? Module) } 
    end

    def get_class first_module
      if first_module.constants.empty? 
        first_module
      else
        tmp_class = first_module.constants.select{|c| first_module.const_get(c).is_a? Class}.first
        first_module.const_get(tmp_class)
      end 
    end

  end
end  