# We have an Oracle class and a RoadTrip class that inherits from the Oracle
# class.

class Oracle
  def predict_the_future
    'You will ' + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
puts trip.predict_the_future

# Given the inheritance chain, Ruby will look first in the same class whether
# there is a choices method. Since there is, then it will use it instead of the
# one defined in the super class.
