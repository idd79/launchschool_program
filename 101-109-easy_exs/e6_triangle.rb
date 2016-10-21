# Right triangles

def triangle(num)
  1.upto(num) { |t| puts(('*' * t).rjust(num)) }
end

triangle(5)
triangle(9)

def triangle_upsidedown(num)
  num.downto(1) { |t| puts(('*' * t).rjust(num)) }
end

triangle_upsidedown(5)
triangle_upsidedown(9)

def triangle_anyside(num, corner = 1)
  case corner
  when 1 then num.downto(1) { |t| puts(('*' * t).ljust(num)) }
  when 2 then num.downto(1) { |t| puts(('*' * t).rjust(num)) }
  when 3 then 1.upto(num) { |t| puts(('*' * t).ljust(num)) }
  when 4 then 1.upto(num) { |t| puts(('*' * t).rjust(num)) }
  end
end

triangle_anyside(4)
triangle_anyside(4, 2)
triangle_anyside(4, 3)
triangle_anyside(4, 4)
