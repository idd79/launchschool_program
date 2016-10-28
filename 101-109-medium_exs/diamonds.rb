# Diamonds

def mid_point(num)
  num / 2 + 1
end

def array_with_mid_dots(size_array, dots_around)
  array = Array.new(size_array, ' ')
  middle = mid_point(size_array) - 1
  (middle - dots_around).upto(middle + dots_around) { |x| array[x] = '*' }
  array
end

def create_diamond(size)
  diamond = []
  0.upto(mid_point(size) - 1) do |x|
    diamond[x] = array_with_mid_dots(size, x)
  end

  mid_point(size).upto(size - 1) do |x|
    diamond[x] = diamond[2 * (mid_point(size) - 1) - x]
  end
  diamond
end

def print_diamond(diamond)
  diamond.each do |x|
    puts x.join
  end
end

print_diamond(create_diamond(1))
puts ''
print_diamond(create_diamond(3))
puts ''
print_diamond(create_diamond(5))
puts ''
print_diamond(create_diamond(9))
