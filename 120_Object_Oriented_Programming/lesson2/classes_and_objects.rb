# Lecture Classes and Objects

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.last_name
p bob.name                  # => 'Robert Smith'

bob.name = 'John Adams'
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
p bob.name

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name == rob.name

puts "The person's name is: #{bob}"
