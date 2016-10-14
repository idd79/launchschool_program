# Display an 8-pointed star in an nxn grid

def row_with_stars(size, spaces)
  array = Array.new(size, ' ')
  center = size / 2
  array[center] = array[center + spaces + 1] = array[center - spaces - 1] = '*'
  array
end

def star(num)
  center = num / 2
  mid_star = []
  (0...center).each { |t| mid_star << row_with_stars(num, t) }
  mid_star.reverse.each { |a| puts a.join }
  puts '*' * num
  mid_star.each { |a| puts a.join }
end

star(7)
puts ''
star(9)
puts ''
star(11)
