require 'fileutils'
require 'tempfile'
module Refactor
  class Klass
    attr_accessor :klass, :stringfile, :filename, :instance

    def initialize file 
      dir, base = File.split(file)
      @filename = base   

      tmp_module = Module.dup
      tmp_module.class_eval(File.read(file)) 
      obj = get_class tmp_module  
      @klass = eval(obj.name.split("::")[1..100].join("::"))   
    end   

    def get_class first_module
      if first_module.constants.empty? 
        first_module
      else 
        get_class first_module.const_get(first_module.constants.first)
      end 
    end

    def name
      @klass.name.split("::")[1..100].join("::")
    end

    def parent
      @klass.parent.to_s.split("::")[1..100].join("::")
    end

    def full_name
      klass.name
    end

    def self.name_klass klass
      klass.name.split('::').last
    end

    def name_klass
      self.klass.name.split('::').last
    end

    def methods
      (@klass.methods(false) + @klass.instance_methods(false))
    end 
  end
end   

# module ModuleOne
# end

# module ModuleTwo
# end