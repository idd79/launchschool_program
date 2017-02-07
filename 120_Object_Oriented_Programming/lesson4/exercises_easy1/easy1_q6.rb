# What could we add to the class below to access the instance variable @volume?

# class Cube
#   def initialize(volume)
#     @volume = volume
#   end
# end

# We can add a getter method either with attr_reader or defining our own method.
# For example:

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  # Alternatively, with our own method

  def get_volume
    @volume
  end
end

cube1 = Cube.new(10)
p cube1.volume
p cube1.get_volume
