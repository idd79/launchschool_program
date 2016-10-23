# Swap Case

def swapcase(string)
  array = string.chars
  array.map { |char| char == char.downcase ? char.upcase : char.downcase }.join
end

p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
