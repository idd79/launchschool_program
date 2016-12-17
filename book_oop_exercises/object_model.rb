# Define a class, include a module, and initiate an object

module Hello
  def print_hello
    puts 'Hello World!'
  end
end

class MyClass
  include Hello
end

my_object = MyClass.new
my_object.print_hello
