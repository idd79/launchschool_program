# Does my list include this?

def include?(array, value)
  array.any? { |x| x == value }
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Other solutions (from Launchschool)

def include2?(array, value)
  !!array.find_index(value)
end

def include3?(array, value)
  array.each { |element| return true if value == element }
  false
end

def include4?(array, value)
  array.count(value) > 0
end

def include5?(arr, e)
 !arr.keep_if {|x| x == e}.empty?
end

def include6?(arr, num)
  !!arr.bsearch {|el| el == num}
end

def include7?(array, number)
  array.one? { |element| element == number }
end
