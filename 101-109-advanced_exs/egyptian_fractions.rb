# Egyptial fractions

require 'pry'

def egyptian(rt)
  array = [1]
  denom = rt > 1 ? 1 : 0
  sum = 1
  while rt != sum
    denom += rt > 1 ? 1 : -1
    next if rt < sum + Rational(1, denom) && rt > 1
    next if rt > sum + Rational(1, denom) && rt < 1
    array << denom
    sum += Rational(1, denom)
  end
  array
end

p egyptian(Rational(2, 1))
p egyptian(Rational(137, 60))
p egyptian(Rational(3, 1))
p egyptian(Rational(127, 130))  # => [1, -44, -2860]
p egyptian(Rational(5, 7))
p egyptian(Rational(1, 1))
p egyptian(Rational(1, 2))
p egyptian(Rational(3, 4))
p egyptian(Rational(39, 20))

def unegyptian(array)
  array.reduce(0) { |sum, a| sum + Rational(1, a) }
end

p unegyptian([1, 2, 3, 6])
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Launchschool solution

def egyptian2(target_value)
  denominators = []
  unit_denominator = 1
  until target_value == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= target_value
      target_value -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end

  denominators
end

p egyptian2(Rational(5, 7))
