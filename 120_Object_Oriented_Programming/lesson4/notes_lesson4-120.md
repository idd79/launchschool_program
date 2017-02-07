# Lesson 4 Notes

## Easy 1 Exercises

- We can call the name of `Class` in string interpolation using with `self.class`. Example:

```ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!
```

This works in the following way:

1. `self` refers to the object itself, in this case either `Car` or `Truck`.
2. Then we ask `self` to tell us its class with `.class`.


- We can ask whether a class has instance variables with the method `instance_variables`:

```ruby
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new('cheese')
orange = Fruit.new('apple')

hot_pizza.instance_variables
# => [:@name]
orange.instance_variables
# => []
```

Although by looking at the class we can that the `Pizza` class has an instance variable as there is one variable that starts with `@`, the method allows us to double check and make sure.

- To access instance variables, technically we don't need anything at all. We can just use the `instance_variable_get` method. Example:

```ruby
big_cube = Cube.new(5000)
big_cube.instance_variable_get("@volume")
=> 5000
```

However, it is generally not a good idea to access instance variables in this way, so it is better to add a getter method.

## Easy 2 Exercises

- Remember that to find the object's ancestors we use the method `ancestors`.
- Keep in mind this is a class method and it will not work if you call this method on an instance of a class (unless of course that instance has a method called `ancestors`).

- What are the benefits of using OOP in Ruby? Let's mention some:
    + Creating objects allow programmers to think more abstractly about the code they are writing.
    + Objects are represented by nouns so are easier to conceptualize.
    + It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
    + It allows us to easily give functionality to different parts of an application without duplication.
    + We can build applications faster as we can reuse pre-written code.
    + As the software becomes more complex this complexity can be more easily managed.
 
