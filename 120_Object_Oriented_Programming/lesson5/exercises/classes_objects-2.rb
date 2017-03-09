# Exercise 120-Lesson 5.

class Cat
  attr_accessor :name
  @@count = 0

  COLOR = 'purple'

  def initialize(name)
    @name = name
    @@count += 1
  end

  def self.total
    puts @@count
  end

  def rename(new_name)
    self.name = new_name
  end

  def identify
    self
  end

  def self.generic_greeting
    puts "Hello, I'm a cat!"
  end

  def personal_greeting
    puts "Hello, my name is #{name}!"
  end

  def greet
    puts "Hello my name is #{name} and I'm a #{COLOR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
kitty.personal_greeting
kitty.greet
puts kitty
Cat.generic_greeting
Cat.total
