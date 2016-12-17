# Inheritance

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

teddy = Dog.new
puts teddy.speak        # => "bark!"
puts teddy.swim         # => "swimming!"

karl = Bulldog.new
p karl.speak
p karl.swim
p karl.jump

fluffy = Cat.new
puts fluffy.speak
puts fluffy.jump
puts fluffy.run

puts '-----'
puts Pet.ancestors
puts '-----'
puts Dog.ancestors
puts '-----'
puts Bulldog.ancestors
puts '-----'
puts Cat.ancestors