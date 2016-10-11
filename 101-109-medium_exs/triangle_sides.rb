# Decide whether the triagle is equilateral, isosceles or scalene
# based on the lenghts of its 3 sides

def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  longest_side = sides.max
  shortest_2 = sides.min(2).reduce(:+)
  return :invalid if shortest_2 < longest_side || sides.include?(0)
  options = [s1 - s2, s1 - s3, s2 - s3]

  case options.count(0)
  when 3
    :equilateral
  when 1
    :isosceles
  when 0
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

p triangle(3, 3, 3)
p triangle(3, 3, 1.5)
p triangle(3, 4, 5)
p triangle(0, 3, 3)
p triangle(3, 1, 1)
