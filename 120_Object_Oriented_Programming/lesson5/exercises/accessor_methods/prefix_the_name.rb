# Exercise 120-Lesson 5.

# Add the appropriate accessor methods so that @name is returned with the added
# prefix 'Mr.'.

class Person
  attr_writer :name

  def name
    # 'Mr. ' + @name # or
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name
