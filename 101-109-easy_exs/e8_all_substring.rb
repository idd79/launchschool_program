# All substrings

def substrings_at_start(string)
  array = []
  # string.chars.each_index { |i| array << string.chars[0..i].join }
  string.chars.each_index { |i| array << string[0..i] }
  array
end

def substrings(string)
  result = []
  string.chars.each_index do |index|
    index.upto(string.size - 1) { |t| result << string[index..t] }
  end
  result
end

def substrings2(string)
  result = []
  string.chars.each_index { |i| result << substrings_at_start(string[i..-1]) }
  result.flatten
end

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

p substrings2('abcde')
