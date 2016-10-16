# Easy 4 101-109 exercises

def next_exc
  puts '-' * 5 + 'Next Exercise' + '-' * 5
end

# Short Long Short (Ex. 1)

def short_long_short(*args)
  strings = args.sort { |a, b| a.size <=> b.size }
  strings.join + strings[0]
end

p short_long_short('hello', 'jel', 'cat', 'animal')

p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz')      == 'xyz'

# What century is that? (Ex. 2)

def ordinal_ending(number)
  return 'th' if number.to_s.size > 1 && number.to_s[-2] == '1'

  case number.to_s[-1]
  when '1' then 'st'
  when '2' then 'nd'
  when '3' then 'rd'
  # when /[04-9]/ then 'th'
  else 'th'
  end
end

def century(year)
  century = (year.to_f / 100).ceil
  ending  = ordinal_ending(century)
  "#{century}#{ending}"
end

p century(2000)   == '20th'
p century(2001)   == '21st'
p century(1965)   == '20th'
p century(256)    == '3rd'
p century(5)      == '1st'
p century(10_103) == '102nd'
p century(1052)   == '11th'
p century(1127)   == '12th'
p century(11_201) == '113th'

next_exc

# Leap Years (Part 1) Ex. 3

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 100 == 0 && year % 400 == 0
    true
  else
    false
  end
end

p leap_year?(2016)   == true
p leap_year?(2015)   == false
p leap_year?(2100)   == false
p leap_year?(2400)   == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000)   == true
p leap_year?(1900)   == false
p leap_year?(1752)   == true
p leap_year?(1700)   == false
p leap_year?(1)      == false
p leap_year?(100)    == false
p leap_year?(400)    == true

# or

require 'date'

def leap_year2?(year)
  Date.new(year, 1, 1, Date::GREGORIAN).leap?
end

# Leap Years (Part 2) Ex. 4

def leap_year3?(year)
  return true if year <= 1752 && year % 4 == 0

  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end
end

p leap_year3?(2016)   == true
p leap_year3?(2015)   == false
p leap_year3?(2100)   == false
p leap_year3?(2400)   == true
p leap_year3?(240000) == true
p leap_year3?(240001) == false
p leap_year3?(2000)   == true
p leap_year3?(1900)   == false
p leap_year3?(1752)   == true
p leap_year3?(1700)   == true
p leap_year3?(1)      == false
p leap_year3?(100)    == true
p leap_year3?(400)    == true

# or

require 'date'

def leap_year4?(year)
  if year <= 1752
    Date.new(year, 1, 1, Date::JULIAN).leap?
  else
    Date.new(year, 1, 1, Date::GREGORIAN).leap?
  end
end

# or

def leap_year5?(year)
  if year > 1752
    Date.gregorian_leap?(year)
  else
    Date.julian_leap?(year)
  end
end

next_exc

# Multiples of 3 and 5 (Ex. 5)

def multisum(num)
  array = (1..num).select { |x| x % 3 == 0 || x % 5 == 0 }
  array.reduce(0, :+)
end

p multisum(3)    == 3
p multisum(5)    == 8
p multisum(10)   == 33
p multisum(1000) == 234168

next_exc

# Running Total (Ex. 6)

def running_total(array)
  sum = 0
  array.map do |x|
    sum += x
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

def running_total2(array)
  sum = 0
  array.each_with_object([]) { |x, a| a << sum += x }
end

def running_total3(array)
  result = []
  array.each_index do |i|
    result << array[0..i].inject(0, :+)
  end
  result
end

next_exc

# Convert a string to a number (Ex. 7)

def string_to_integer(string)
  indexes = ('0'..'9').to_a
  array = string.reverse.chars
  array.map.with_index { |num, i| indexes.index(num) * (10**i) }.reduce(:+)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

def hexadecimal_to_integer(string)
  indexes = ('0'..'9').to_a + ('a'..'f').to_a
  array = string.reverse.chars
  new_array = array.map.with_index do |num, i|
    indexes.index(num.downcase) * (16**i)
  end
  new_array.inject(:+)
end

p hexadecimal_to_integer('4D9f') == 19871

next_exc

# String to signed integer (Ex. 8)

def string_to_signed_integer(string)
  case string[0]
  when '-'
    string_to_integer(string[1..-1]) * -1
  when '+'
    string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

next_exc

# Convert a Number to a String! (Ex. 9)

def digits(num)
  q, r = num.divmod(10)
  array = [r]

  while q > 0
    q, r = q.divmod(10)
    array.unshift(r)
  end
  array
end

# digits(435) => [4, 3, 5]

def integer_to_string(num)
  indexes = ('0'..'9').to_a
  digits(num).map { |x| indexes.at(x) }.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0)    == '0'
p integer_to_string(5000) == '5000'

next_exc

# Conver a signed number to a string! (Ex. 10)

def signed_integer_to_string(num)
  return '0' if num == 0
  num > 0 ? '+' + integer_to_string(num.abs) : '-' + integer_to_string(num.abs)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0)    == '0'

def signed_integer_to_string2(number)
  num_abs = integer_to_string(number.abs)

  case number <=> 0
  when -1 then "-#{num_abs}"
  when +1 then "+#{num_abs}"
  else         num_abs
  end
end
