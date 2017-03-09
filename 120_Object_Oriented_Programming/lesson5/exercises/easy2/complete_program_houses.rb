# Exercise 120-Lesson 5. Easy 2

class House
  include Comparable

  attr_reader :price, :footage

  def initialize(price, footage)
    @price = price
    @footage = footage
  end

  def <=>(other_house)
    price <=> other_house.price
  end

  # Specified in this way, you have to compare a particular attribute, such as
  # price or footage
  # def <=>(other_house)
  #   self <=> other_house
  # end
end

home1 = House.new(100_000, 80)
home2 = House.new(150_000, 120)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1
# Used if <=> is specified in the second way
# puts "Home 1 is bigger" if home1.footage > home2.footage
# puts "Home 2 is bigger" if home1.footage < home2.footage
