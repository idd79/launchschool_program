# Lesson 5 - Easy 1 exercises

class Person
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end

  def first_name=(string)
    @first_name = string.capitalize
  end

  def last_name=(string)
    @last_name = string.capitalize
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

# Expected output:

# John Doe
# Jane Smith
