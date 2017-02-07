# Create a class called Greeting with a single method called greet that takes a
# string argument and prints that argument to the terminal.

class Greeting
  def greet(string)
    puts string
  end
end

hello = Greeting.new
hello.greet('hola')

# Now create two other classes that are derived from Greeting: one called Hello
# and one called Goodbye. The Hello class should have a hi method that takes no
# arguments and prints "Hello". The Goodbye class should have a bye method to
# say "Goodbye". Make use of the Greeting class greet method when implementing
# the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye
# classes.

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end

msg1 = Hello.new
msg2 = Goodbye.new
msg1.hi
msg2.bye
