# Classes and Objects II

class MyCar

  attr_accessor :color
  attr_reader :year, :model
  
  def initialize(year, color, model)
    @year = year
    self.color = color
    @model = model
    @speed = 0
  end

  def to_s
    "This car is a #{color}, #{year} #{model}."
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

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

end

MyCar.gas_mileage(13, 351)

my_car = MyCar.new(2012, 'silver', 'accord')

puts my_car

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name
