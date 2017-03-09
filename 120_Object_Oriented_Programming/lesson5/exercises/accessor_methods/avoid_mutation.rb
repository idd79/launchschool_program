# Exercise 120-Lesson 5.

# The following code is flawed. It currently allows @name to be modified from
# outside the method via a destructive method call. Fix the code so that it
# returns a copy of @name instead of a reference to it.

# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# person1 = Person.new('James')
# person1.name.reverse!
# puts person1.name

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name

# We use #clone here to provide a copy of the string instead of a reference to
# it

# Alternatively we could use the following: (my own finding, use with
# discretion!!)

class Person2
  def initialize(name)
    @name = name
  end

  def name
    "#{@name}"
  end
end

person2 = Person2.new('James')
person2.name.reverse!
puts person2.name
