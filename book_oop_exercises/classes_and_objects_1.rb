# Classes and Objects I

class MyCar

  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
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
end

my_car = MyCar.new(2012, 'gray', 'accord')
my_car.speed_up(5)
my_car.current_speed
my_car.break(2)
my_car.break
my_car.current_speed
my_car.shut_off
my_car.current_speed

my_car.color = 'white'
puts my_car.color
puts my_car.year

my_car.spray_paint
puts my_car.color
