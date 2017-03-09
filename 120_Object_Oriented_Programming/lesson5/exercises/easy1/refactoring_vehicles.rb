# Exercise 120-Lesson 5. Easy 1

# Refactor these classes so they all use a common superclass, and inherit
# behavior as needed.

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

car1 = Car.new('Ford', 2010)
p car1.wheels
truck1 = Truck.new('Ford', 2010, 15)
p truck1.wheels
