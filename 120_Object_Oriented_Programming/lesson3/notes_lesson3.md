# Lesson 3 Notes

## Equivalence

Let's say we have the following example:

```ruby
str1 = 'something'
str2 = 'something'

str1.class  # => String
str2.class  # => String
```

If we modify `str1`, it would have no effect on the `str2` object; they are different objects:

```ruby
str1 = str1 + " else"
str1                    # => "something else"

str1 == str2            # => false
```

In order to test equivalence we use `==`. What we are asking exactly with `==` is "are the values within the two objects the same?" and not "are the two objects the same?".

In the case of `String` objects, it knows we're asking the first question and not the second. But what if we wanted to ask the second question? Suppose we care about whether the two variables actually point to the same object? That's where another method comes in: the `equal?` method.

```ruby
str1 = "something"
str2 = "something"
str1_copy = str1

# comparing the string objects' values
str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

# comparing the actual objects
str1.equal? str2        # => false
str1.equal? str1_copy   # => true
str2.equal? str1_copy   # => false
```

Notice that when we use `==` to compare the string object values, everything is true; all 3 variables have the value `"something"`. However, the story changes when we use the `equal?` method. Because the `equal?` method checks to see if the two objects are the same, only `str1`.`equal?` `str1_copy` returns true. This is because `str1` and `str1_copy` reference the same object, or space in memory.

**Note:**: this is good time to review the topic _Variables as Pointers_.

**In summary**, the `==` method compares the two variables' values whereas the `equal?` method determines whether the two variables point to the same object.

### The `==` method

`==` is not an operator in Ruby, like the `=` assignment operator. Instead, it's actually an instance method available on all objects. Ruby gives the `==` method a special syntax to make it look like a normal operator. For example, instead of calling the method as `str1.==(str2)`, we can use the more natural syntax `str1 == str2`. Both options are functionally equivalent.

how does `==` know what value to use for comparison" is: it's determined by the class.

The original `==` method is defined in the `BasicObject` class, which is the parent class for all classes in Ruby. This implies every object in Ruby has a `==` method. However, each class should override the `==` method to specify the value to compare.

**Example on how to override the `==` method:**

When comparing objects from a class, the `==` behaves the same as the `equal?` method which is not very informative. Let's see:

```ruby
class Person
  attr_accessor :name
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => false

bob_copy = bob
bob == bob_copy            # => true
```

So in the above case, it would be better to redefine the `==` to something more specific. For example:

```ruby
class Person
  attr_accessor :name

  def ==(other)
    name == other.name     # relying on String#== here
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => true
```

Overriding the `==` also gives us the `!=` method.

### `object_id`

We can use this method to determine whether two variables are pointing to the same object. Example:

```ruby
str1 = "something"
str2 = "something"

str1.object_id            # => 70186013144280
str2.object_id            # => 70186013536580

arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => false

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => true

int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => true
```

This means that symbols and integers behave slightly differently in Ruby than other objects. If two symbols or two integers have the same value, they are also the same object. This is a performance optimization in Ruby, because you can't modify a symbol or integer. This is also why Rubyists prefer symbols over strings to act as hash keys: it's a slight performance optimization and saves on memory.

### `===`

Just like `==`, it looks like a built-in Ruby operator when you use it, but it's in fact an instance method. The more confusing part about this method is that it's used implicitly by the case statement.

Example:

```ruby
num = 25

case num
when 1..50
  puts "small number"
when 51..100
  puts "large number"
else
  puts "not in range"
end
```

Behind the scenes, the case statement is using the `===` method to compare each when clause with the num. In this example, the when clause contains only ranges, so it's using `Range#===` in each when clause.

**Sidenote**: the `===` operator in JavaScript is very different from its function in Ruby. Do not get the two confused.

### `eql?`

The `eql?` method determines if two objects contain the same value and if they are of the same class. This method is used most often by `Hash` to determine equality among its members. It's not used very often.

## To Summarize

`==`

- the `==` operator compares two objects' values, and is frequently used.
- the `==` operator is actually a method. Most built-in Ruby classes, like Array, String, Fixnum, etc override the `==` method to specify how to compare objects of those classes.
- if you need to compare custom objects, you should override the `==` method.
- understanding how this method works is the most important part of this assignment.

_Less Important_

`equal?`

- the equal? method goes one level deeper than `==` and determines whether two variables not only have the same value, but also whether they point to the same object.
- do not override `equal?`.
- the `equal?` method is not used very often.
- calling `object_id` on an object will return the object's unique numerical value. Comparing two objects' `object_id` has the same effect as comparing them with `equal?`.

`===`

- used implicitly in case statements.
- like ==, the `===` operator is actually a method.
- you rarely need to call this method explicitly, and only need to implement it in your custom classes if you anticipate your objects will be used in `case` statements, which is probably pretty rare.

`eql?`

- used implicitly by `Hash`.
- very rarely used explicitly.


## Variable Scope

When we talked about variable scoping rules in the past, we always talked about _local variables_. In this assignment, we'll talk about variable scoping rules for _instance_ and _class variables_ and _constants_.

### Instance variable scope

Instance variables start with `@` and are scoped at the object level. They are used to track individual object state, and do not cross over between objects.

### Class variable scope

These variables start with `@@` and are scoped at the class level.

These variables exhibit two main behaviors:

- all objects share one copy of the class variable.
- class methods can access class variables, regardless where they are initialized.

```ruby
class Person
  @@total_people = 0            # initialized at the class level

  def self.total_people
    @@total_people              # accessible from class method
  end

  def initialize
    @@total_people += 1         # mutable from instance method
  end

  def total_people
    @@total_people              # accessible from instance method
  end
end

Person.total_people             # => 0
Person.new
Person.new
Person.total_people             # => 2

bob = Person.new
bob.total_people                # => 3

joe = Person.new
joe.total_people                # => 4

Person.total_people             # => 4
```

Only class variables can share state between objects. (We're going to ignore globals.)

### Constant variable scope

Constant variables are usually just called constants, because you're not supposed to re-assign them to a different value. If you do re-assign a constant, Ruby will warn you (but won't generate an error).

Constants begin with a capital letter and have lexical scope. Let's play around with constant scope.

Example:

```ruby
class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  attr_reader :name

  def self.titles
    TITLES.join(', ')
  end

  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

Person.titles                   # => "Mr, Mrs, Ms, Dr"

bob = Person.new('bob')
bob.name                        # => "Ms bob"  (output may vary)
```

The rules for accessing constants is pretty easy: it's available in class methods or instance methods (which implies it's accessible from objects).

## Inheritance and variable scope

How does inheritance affect variables? Let's take a look:

### Instance variables

Instance variables behave very similar to how instance methods would, except that we must first call the method that initializes them, and then sub-classes can access them.

### Class variables

Class variables are in general accessible to sub-classes. However, there is a potential risk that a sub-class modifies a class variable that has been defined in an super class, and so it will affect all other sub-classes of the super class.

For this reason, avoid using class variables when working with inheritance. In fact, some Rubyists would go as far as recommending avoiding class variables altogether. The solution is usually to use _class instance variables_, but that's a topic we aren't ready to talk about yet.

### Constants

Can we reference a constant defined in a different class? The answer is Yes, by calling the variable using the format `ClassName::CONSTANT_NAME`.

`::` is the **namespace** resolution operator and can be used on classes, modules, or constants.

The above is applied to unconnected classes, however for connected classes, a constant initialized in a super-class is inherited by the sub-class, and can be accessed by both class and instance methods. However, this won't work if you call the constant from a method that is defined in a module, and so you need to use the `ClassName::CONSTANT_NAME` format.

### Summary


- **Instance Variables** behave the way we'd expect. The only thing to watch out for is to make sure the instance variable is initialized before referencing it.
- **Class Variables** have a very insidious behavior of allowing sub-classes to override super-class class variables. Further, the change will affect all other sub-classes of the super-class. This is extremely unintuitive behavior, forcing some Rubyists to eschew using class variables altogether.
- **Constants** have lexical scope which makes their scope resolution rules very unique compared to other variable types. If Ruby doesn't find the constant using lexical scope, it'll then look at the inheritance hierarchy.

## Fake Operators

We can, and sometimes we should, override the operators that are actually methods, such as `==`, `+`, `-`, `>`, `<`, among others (see complete table [here](https://launchschool.com/lessons/d2f05460/assignments/9a7db2ee)).

We showed already how to override the Equality `==` method. Let's see how to override other methods.

### Comparison methods

Example:

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)

puts "bob is older than kim" if bob > kim

puts "bob is older" if bob > kim            # => "bob is older"
puts "bob is older" if bob.>(kim)           # => "bob is older"
```

_Note_ that overriding `>` doesn't give us automatically the `<` method, so we should override it as well in case we want to write something like `bob < kim`, which would give us a `NoMethodError` otherwise.

### The `<<` and `>>` shift methods

We already know how these methods operate with `Arrays`, however they are not defined for `Hashes` for example. Let's see:

```ruby
my_hash = {a: 1, b: 2, c: 3}
my_hash << {d: 4}   # => NoMethodError: undefined method `<<' for Hash
```

When overriding fake operators, choose some functionality that makes sense when used with the special operator-like syntax. For example, using the `<<` method fits well when working with a class that represents a collection.

```ruby
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end
end

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmitt Smith", 46)     # suppose we're using the Person class from earlier

cowboys << emmitt                    # will this work?

cowboys.members                      # => [#<Person:0x007fe08c209530>]
```

If we wanted to be strict, we could even build in a guard clause to reject adding the member unless some criteria is met.

```ruby
def <<(person)
  return if person.not_yet_18?     # suppose we had Person not_yet_18?
  members.push person
end
```

### The plus method

The functionality of the `+` should be either incrementing or concatenation with the argument. You are, of course, free to implement it however you wish, but it's probably a good idea to follow the general usage of the standard libraries. Here's an example:

```ruby
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    members + other_team.members
  end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners               # what is dream_team?
```

In the example above `dream_team` returns a new `Array` object, in particular, an array of `Person` objects. However, our `Team#+` method should return a new `Team` object, not an `Array`, if we want to follow the same pattern of `+` applied in other classes.

It should look something like this:

```ruby
class Team
  # ... rest of class omitted for brevity

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
end
```

And so,

```ruby
dream_team = niners + cowboys
puts dream_team.inspect         # => #<Team:0x007fac3b9eb878 @name="Temporary Team" ...
```

So now `dream_team` is not longer an array but a `Team` object.

### Element setter and getter methods

Out of all the fake operators, perhaps `[]` and `[]=` are the most surprising:

```ruby
my_array = %w(first second third fourth)    # ["first", "second", "third", "fourth"]

# element reference
my_array[2]                                 # => "third"
my_array.[](2)                              # => "third"
```

Furthermore,

```ruby
# element assignment
my_array[4] = "fifth"
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth"]

my_array.[]=(5, "sixth")
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth", "sixth"]
```

f we want to use the element setter and getter methods in our class, we first have to make sure we're working with a class that represents a collection. In the following example, remember that `members` is an array, so we can take advantage of that:

```ruby
class Team
  # ... rest of code omitted for brevity

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end
```

```ruby
# assume set up from earlier
cowboys.members                           # => ... array of 3 Person objects

cowboys[1]                                # => #<Person:0x007fae9295d830 @name="Emmitt Smith", @age=46>
cowboys[3] = Person.new("JJ", 72)
cowboys[3]                                # => #<Person:0x007fae9220fa88 @name="JJ", @age=72>
```

### Summary

In this assignment, we saw how many operators are in fact methods that Ruby gives special treatment to. Because they are methods, we can implement them in our classes and take advantage of the special syntax for our own objects. If we do that, we must be careful to follow conventions established in the Ruby standard library. Otherwise, using those methods will be very confusing.
