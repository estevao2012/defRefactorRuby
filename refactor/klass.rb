require 'fileutils'
require 'tempfile'
require 'method_source'

module Refactor
  class Klass
    attr_accessor :stringfile, :filename, :instance, :file, :constante
    attr_accessor :name_klass, :methods, :name, :parent, :attributes, :superclass
    attr_accessor :source_methos

    def initialize file, version
      dir, base = File.split(file)
      @filename = base   
      @file = file

 
      begin
        constroi_minha_classe
        @name_klass = @constante.name.split('::').last
        @methods = (@constante.methods(false) + @constante.instance_methods(false)) 
        @name = @constante.name.split("::").join("::")
        @parent = @constante.parent.to_s.split("::").join("::")
        @superclass = @constante.superclass
        @attributes = @constante.attributes
        remove_class_do_scopo
      rescue Exception => erro
        # puts erro
      end

    end   

    def constroi_minha_classe
      @constante ||= my_current_name
      return eval("#{@constante}")
    end

    def my_current_name
      classes = ObjectSpace.each_object(Class).to_a 
      load @file
      new_classes = ObjectSpace.each_object(Class).to_a - classes 
      return new_classes.first
    end

    def remove_class_do_scopo
      wrapper = (@constante.name.split("::") - [name_klass])
      if wrapper == [] then 
        Object.send(:remove_const, @constante.name)
      else 
        wrapper.join("::").constantize.send(:remove_const, @constante.name.split('::').last ) 
      end
    end 


    def self.k_name klass
      klass.name
    end
  end
end    