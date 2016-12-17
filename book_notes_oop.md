# Object Oriented Programming (OOP)

## Modules

A **module** is a collection of behaviors that is usable in other classes via **mixins**.

A module is "mixed in" to a class using the `include` reserved word. Example:

```ruby
# good_dog.rb

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!
```


We can use the `ancestors` method on any class to find out the method look up chain. This is important when working with class and mixins inheritance.

## Initializing an Object

The `initialize` method gets called every time you create a new object. Example:

```ruby
# good_dog.rb

class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new   # => "This object was initialized!"
```

- We refer to the `initialize` method as a constructor, because it gets triggered whenever we create a new object.

## Instance Variables

- `@name` is an instant variable called `name`. It is a variable that exists as long as the object instance exists and it is one of the ways we tie data to objects. It does not "die" after the initialize method is run. It "lives on", to be referenced, until the object instance is destroyed.

- Example:

```ruby
# good_dog.rb

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    'Arf!'
  end
end
```

- You can pass arguments into the `initialize` method through the `new` method. E.g. `sparky = GoodDog.new("Sparky")`, and `puts sparky.speak`.
- All objects created under this class will have the same behavior (they all will `speak`) but will have a different `state`, which is given by the `name`.
- We could change our `speak` method so that it includes the `name`:

```ruby
# good_dog.rb

def speak
  "#{@name} says arf!"
end
```

## Accessor Methods

- If we want to have access to the `name` of the object above to either return it or to change it, we would have to write some `getter` and `setter` methods. Something like:

```ruby
# good_dog.rb

class GoodDog
  def initialize(name)
    @name = name
  end

  def name                  # This was renamed from "get_name"
    @name
  end

  def name=(n)              # This was renamed from "set_name="
    @name = n
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"
```

- However, this structure takes a a lot of space, and since it is very common in every class, then Ruby provides the `attr_accessor` method to automatically create the `getter` and `setter` methods for us. Example:

```ruby
# good_dog.rb

class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"
```

- The `attr_accessor` method takes a symbol as an argument, which it uses to create the method `name` for the `getter` and `setter` methods. That one line replaced two method definitions.
- If we only want the getter method without the setter method, then we would want to use the `attr_reader` method. It works the same way but only allows you to retrieve the instance variable. 
- If you only want the `setter` method, you can use the `attr_writer` method. All of the `attr_*` methods take a `Symbol` as parameters.
- In general, we can use this syntax if there are more states you're tracking:

```ruby
attr_accessor :name, :height, :weight
```

## Accessor Methods in Action

- In the previous section, the `speak` method referenced the `@name` instance variable, like below:

```ruby
def speak
  "#{@name} says arf!"
end
```

- Instead of referencing the instance variable directly, we want to use the `name` getter method that we created earlier, and that is given to us now by `attr_accessor`. We'll change the `speak` method to this:

```ruby
def speak
  "#{name} says arf!"
end
```

- By removing the `@` symbol, we're now calling the instance method, rather than the instance variable.
- Technically, you could just reference the instance variable, but it's generally a good idea to call the _getter_ method instead. Why? It is much easier to make changes in one place (the method), instead of every place where the instance variable has been interpolated, for example if we want to change the format to be printed.
- Just like with the getter method, we also want to use the setter method whenever we want to change our instance variable. However there is something we need to be aware of. Say we have the following:

```ruby
# good_dog.rb

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end
```

- If we want to change the information of the object, then we can do it like this:

```ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs 
```

Now, if we use the same approach of not using `@` inside the `change_info` method, then we get:

```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```

However, there is a problem now. Let's try to change the information as before:

```ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is
```

So it didn't work this time. Why? Because Ruby thought that we were creating local variables instead of calling the setter method.

To avoid this, we need to call the setter methods with `self`:

```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

To be consistent, we could also adopt this syntax for the getter methods as well, though it is not required:

```ruby
def info
  "#{self.name} weighs #{self.weight} and is #{self.height} tall."
end
```

Note that prefixing `self.` is not restricted to just the accessor methods; you can use it with any instance method. For example, the `info` method is not a method given to us by attr_accessor, but we can still call it using `self.info`. Example:

```ruby
# good_dog.rb

class GoodDog
  # ... rest of code omitted for brevity
  def some_method
    self.info
  end
end
```

## Class Methods

All the previous methods were instance methods, which can be called only on objects of the class. There are also **class methods** which can be called directly on the class itself without the need to instantiate an object.

- When defining a class method, we prepend the method name with the reserved word `self`., like this:

```ruby
# good_dog.rb
# ... rest of code ommitted for brevity

def self.what_am_i         # Class method definition
  "I'm a GoodDog class!"
end
```

- Then when we call the class method, we use the class name followed by the method, e.g., `GoodDog.what_am_i  # => I'm a GoodDog class!`

Why do we need a class method for this? Class methods are where we put functionality that does not pertain to individual objects. Objects contain state, and if we have a method that does not need to deal with states, then we can just use a class method.

## Class Variables

- Class variables are created using two `@` symbols. E.g. `@@name`.

Example:

```ruby
class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2
```

- The above is an example of using a class variable and a class method to keep track of a class level detail that pertains only to the class, and not to individual objects.

## Constants

While technically constants just need to begin with a capital letter, most Rubyists will make the entire variable uppercase.

Example:

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age             # => 28
```

`DOG_YEARS` is a variable that will never change for any reason so we use a constant. It is possible to reassign a new value to constants but Ruby will throw a warning.

## The to_s Method

The `to_s` method comes built in to every class in Ruby. After creating the object `sparky` in the example above, if we use `puts sparky      # => #<GoodDog:0x007fe542323320>`, the `puts` method is actually calling the `to_s` method, that is `puts sparky` is equivalent to `puts sparky.to_s`.

By default the to_s method prints the object’s class and an encoding of the object id.

However, we can customize/overwrite our `to_s` method. For example:

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end
```

And then we have `puts sparky` printing `This dog's name is Sparky and is 28 in dog years.`

Besides being called automatically when using `puts`, another important attribute of the `to_s` method is that it's also automatically called in string interpolation.

```ruby
irb :001 > "#{sparky}"
=> "This dog's name is Sparky and is 28 in dog years."
```

In summary, the `to_s` method is called automatically on the object when we use it with `puts` or when used with string interpolation.

This fact may seem trivial at the moment, but knowing when `to_s` is called will help us understand how to read and write better OO code.

## More about self

`self` can refer to different things depending on where it is used. So far we have seen two clear uses of `self`:

1. When calling setter methods from within the class. Here we use `self` to avoid ambiguity between initializing a local variable and calling a setter method.
2. Use `self` for class methods definitions.

Let's check the following example:

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end
```

Here we are using `self` whenever we want to call an instance method from within the class. But what is really `self` in this case? Let's check:

```ruby
# good_dog.rb

class GoodDog
  # ... rest of code omitted for brevity

  def what_is_self
    self
  end
end
```

And so,

```ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self
 # => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">
```

Therefore, when an instance method calls `self`, it is returning the _calling object_, in this case, the `sparky` object. Therefore, from within the `change_info` method we defined before, calling `self.name=` is the same as calling `sparky.name=`.

The other place we use `self` is when we are defining class methods, e.g.:

```ruby
class MyAwesomeClass
  def self.this_is_a_class_method
  end
end
```

When used in this way, that is, inside a class but outside an instance method, `self` returns the `class` itself. Let's see:

```ruby
class MyAwesomeClass
  def self.this_is_a_class_method
  end

  puts self
end
```

then, 

```ruby
irb :001 > MyAwesomeClass
=> MyAwesomeClass
```

This means that `def self.a_method` is equivalent to `def MyAwesomeClass.a_method`. That's why it's a class method; it's actually being defined on the class.

So just to be clear, from within a class...

1. `self`, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, `self.weight=` is the same as `sparky.weight=`, in our example.
2. `self`, outside of an instance method, references the class and can be used to define class methods. Therefore, `def self.name=(n)` is the same as def `GoodDog.name=(n)`, in our example.

## Inheritance

- The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.

Example:

```ruby
# good_dog_class.rb

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak           # => Hello!
puts paws.speak             # => Hello!
```

Here we use the `<` symbol to signify that the `GoodDog` class is inheriting from the `Animal` class. This means that all of the methods in the `Animal` class are available to the `GoodDog` class for use.

When calling for a method which is both in the subclass and superclass, Ruby first look in the object's class and uses the subclass method if found; if not found then it looks in the superclass. In other words, **the subclass method overrides the superclass method**. Example:

```ruby
# good_dog_class.rb

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!
```

Inheritance can be a great way to remove duplication in your code base. There is an acronym that you'll see often in the Ruby community, "DRY". This stands for "Don't Repeat Yourself".

## Super

There is a function called `super` that allows to call methods up the inheritance hierarchy. Example:

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"
```

A more common way to use `super` is with the `initialize` method:

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
# => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```

Here, in addition to the default behavior, `super` automatically forwards the arguments that were passed to the method from which `super` is called (initialize method in `GoodDog` class). That explains the presence of `@name="brown"` when the `bruno` instance is created.

To avoid this, we can pass arguments to `super` which will be sent up the method lookup chain. Example:

```ruby
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")
# => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```

## Mixing in Modules

Another way to DRY up your code is to use **modules**.

Extracting common methods to a superclass, like we did in the previous section, is a great way to model concepts that are naturally hierarchical. We gave the example of animals. We have a generic superclass called `Animal` that can keep all basic behavior of all animals.

This type of hierarchical modeling works but there are some exceptions. For example. let's say that under our `Animal` class, we have a `Fish` class in which we put a `swim` method. However, there are other animals (e.g. mammals) that are grouped under a different class, and some of those animals can swim as well, but not all, for example, dogs can swim. We cannot move the `swim` method to the `Animal` class because not all animals can swim, and if we add the `swim` method to the `Dog` class that would violate the DRY principle.

So for cases like this, we could group the methods related to animals that can swim into a module and then _mix in_ that module to the corresponding classes. Example:

```ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end
```

**Note**: A common naming convention for Ruby is to use the "_able_" suffix on whatever verb describes the behavior that the module is modeling. You can see this convention with our `Swimmable` module

## Inheritance vs Modules

 - You can only subclass from one class but you can mix in as many modules as you would like.
 - If it's an "is-a" relationship, choose class inheritance. If it's a "has-a" relationship, choose modules. Example: a dog "is an" animal; a dog "has an" ability to swim.
 - You cannot instantiate modules (i.e. you cannot create an object from a module). Modules are used only for namespacing and grouping common methods together.

## Method lookup path

- The method lookup path is th order in which classes are inspected when you call a method.

Let's put inheritance and mixins together to see how that affects the _method lookup path_. Example:

```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end
```

The method lookup path is the path that Ruby takes to look for a method. We can see this with the `ancestors` class method:

```ruby
puts "---Animal method lookup---"
puts Animal.ancestors
```

The output looks like this:

```ruby
---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject
```

Let's check another example with both _mix in_ and _inheritance_:

```ruby
class GoodDog < Animal
  include Swimmable
  include Climbable
  # or
  # include Swimmable, Climbable
end

puts "---GoodDog method lookup"
puts GoodDog.ancestors
```

The outputs is:

```ruby
---GoodDog method lookup---
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
```

The above example tell us:

- The order in which we include modules matters.
- The modules included in the `superclass` `Animal`, such as `Walkable`, also will be consulted, but after the `superclass`.
- Modules (`mix ins`) are consulted before inheritance (`superclasses`). That could be as well as because the last module included in the class is the one consulted first (`Climbable` in this case).

## More Modules

There are two more usages of modules. One is **namespacing**, which means to organize similar classes under a module. The advantages of doing this are two:

- It makes it easy to recognize related classes in our code.
- It reduces the likelihood of our classes colliding with other similar named classes.

Example:

```ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```

We call classes in a module by appending the class name to the module name with two colons(::):

```ruby
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')       # => "kitty"
```

The second use case for modules is to use them as a **container** for methods, called module methods. Example:

```ruby
module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4)
# or we can also call it in this way:
value = Mammal::some_out_of_place_method(4)
# although the former is the preferred way.
```

## Private, Protect, and Public

In all our previous examples, the methods are public. A **public method** is a method that is available to anyone who knows either the class name or the object's name.

Sometimes you need methods that are doing work in the class but don't need to be available to the rest of the program. These methods can be defined as **private**. For this, we use the reserved word `private` and anything below it is private.

Example:

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years

# the output is:
# NoMethodError: private method `human_years' called for
#<GoodDog:0x007f8f431441f8 @name="Sparky", @age=28>
```

Private methods are only accessible by from other methods in the class.

```ruby
# assume the method definition below is above the "private" keyword

def public_disclosure
  "#{self.name} in human years is #{human_years}"
end
```

In summary, private methods are not accessible outside of the class definition at all, and are only accessible from inside the class when called **without** `self`.

**Protected** methods, on the other hand, are something in between public and private methods.

- From outside the class, `protected` methods act like `private` methods.
- From inside the class, `protected` methods are accessible like `public` methods.

Example:

```ruby
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end
```

The output is:

```ruby
fido = Animal.new
fido.a_public_method        # => Will this work? Yes, I'm protected!
fido.a_protected_method
# => NoMethodError: protected method `a_protected_method' called for
#<Animal:0x007fb174157110>
```

## Accidental method overriding

Every class you create inherently subclasses from the class `object`, which is built into Ruby. Example:

```ruby
class Parent
  def say_hi
    p "Hi from Parent."
  end
end

Parent.superclass       # => Object
```

This implies that methods defined in the `object` class are available to all classes.

Further, recall that through the magic of inheritance, a subclass can override a superclass’s method. This means that, if you accidentally override a method that was originally defined in the `Object` class, it can have far-reaching effects on your code.

That said, one Object instance method that's easily overridden without any major side-effect is the `to_s` method. Overall, it’s important to familiarize yourself with some of the common `Object` methods and make sure to not accidentally override them as this can have devastating consequences for your application.
