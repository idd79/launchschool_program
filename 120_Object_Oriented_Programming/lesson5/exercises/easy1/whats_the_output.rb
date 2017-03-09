# Lesson 5 - Easy 1 exercises

# The #upcase! method mutates @name so we need to modify it so @name still print
# the original string.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    # @name.upcase!
    "My name is #{@name.upcase}."
    # upcase_name = @name.clone.upcase!
    # "My name is #{upcase_name}"
  end

  def print_object
    puts @name.object_id
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
