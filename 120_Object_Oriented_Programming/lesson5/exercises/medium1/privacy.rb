# Exercise 120-Lesson 5. Medium 1

# Modify this class so both flip_switch and the setter method switch= are
# private methods.

class Machine
  def initialize
    puts ": Use the instance method '#status' to obtain the status of 'switch'"
  end

  def status
    puts "The machine is '#{switch.to_s}'"
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

mach1 = Machine.new
mach1.start
print mach1.status
mach1.stop
puts mach1.status
