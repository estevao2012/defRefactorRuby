my_class_def= <<-EOF
class MyClassFoo 

  def hello()
    puts "Hello Foo!" 
  end

end
EOF 

Object.class_eval my_class_def


foo=MyClassFoo.new
foo.hello 


Object.send(:remove_const, "MyClassFoo")

bar=MyClassFoo.new


foo.hello 
