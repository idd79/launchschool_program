# Leading substrings

def substrings_at_start(string)
  array = []
  # string.chars.each_index { |i| array << string.chars[0..i].join }
  string.chars.each_index { |i| array << string[0..i] }
  array
end

p substrings_at_start('abc')
p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
