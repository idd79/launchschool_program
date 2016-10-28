# Palindromic substrings

def substrings(string)
  result = []
  string.chars.each_index do |index|
    index.upto(string.size - 1) { |t| result << string[index..t] }
  end
  result
end

def palindromes(string)
  substrings = substrings(string)
  substrings.each_with_object([]) do |item, a|
    a << item if item.reverse == item && item.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam')
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
