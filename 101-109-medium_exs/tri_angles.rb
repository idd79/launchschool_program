# Decide whether a triagle is right, acute or obtuse (or invalid) based on the
# three angles given in a method

def valid_triangle?(a1, a2, a3)
  angles = [a1, a2, a3]
  angles.reduce(:+) == 180 && angles.all? { |x| x > 0 }
end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid unless valid_triangle?(*angles)

  if angles.any? { |a| a == 90 }
    :right
  elsif angles.all? { |a| a < 90 }
    :acute
  elsif angles.any? { |a| a > 90 }
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# Another student's answer

# def triangle(*args)
#   return :invalid if args.inject(:+) != 180 || args.any? { |a| a <= 0}
#   args.include?(90) ? :right : args.any? { |a| a > 90} ? :obtuse : :acute
# end
