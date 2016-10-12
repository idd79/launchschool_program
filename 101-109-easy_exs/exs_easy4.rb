# Easy 4 101-109 exercises

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
