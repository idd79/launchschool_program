# Inheritance exercises

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  require 'time'
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0
  
  def initialize(year, color, model)
    @year = year
    self.color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def speed_up(num = 1)
    @speed += num
    puts "You pushed the gas and accelerated #{num} mph."
  end

  def break(num = 1)
    @speed -= num
    puts "You pushed the brake and descelerated #{num} mph."
  end

  def current_speed
    puts "Your current speed is #{@speed} mph."
  end

  def shut_off
    @speed = 0
    puts 'You shut the car off.'
  end

  def spray_paint
    puts 'What color do you want to paint your car?'
    self.color = gets.chomp
    puts "Your car is now #{color}"
  end

  def age
     "The age of the vehicle (#{self.model}) is #{age_in_years} years."
  end

  private

  def age_in_years
    now = Time.new
    age = now.year - self.year
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "This car is a #{color}, #{year} #{model}."
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def initialize
    puts 'Hello, I am a Truck!'
  end

  def to_s
    'This is a truck!'
  end
end

my_car = MyCar.new(2012, 'silver', 'Honda Accord')

puts my_car

my_truck = MyTruck.new
puts my_truck

puts Vehicle.number_of_vehicles

puts my_truck.can_tow?(3000)

puts Vehicle.ancestors
puts "------"
puts MyCar.ancestors
puts "------"
puts MyTruck.ancestors

puts my_car.age
