# A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each.

def featured(num)
  result = num < 7 ? 7 : num - (num % 7)
  loop do
    result += 7
    num_array = result.to_s.chars
    return result if result.odd? && num_array == num_array.uniq
    break if result >= 9_876_543_210
  end
  'There is no possible number that fulfills those requirements.'
end

p featured(12)          == 21
p featured(20)          == 21
p featured(21)          == 35
p featured(997)         == 1029
p featured(1029)        == 1043
p featured(999_999)     == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)
