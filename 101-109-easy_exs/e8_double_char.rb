# Double Char (Part 1)

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

p repeater('Hello')
p repeater('Hello') == 'HHeelllloo'
p repeater('Good job!') == 'GGoooodd  jjoobb!!'
p repeater('') == ''

# Double char (Part 2)

def double_consonants(string)
  result = string.chars.map do |char|
    # if char =~ /[a-z]/i && char =~ /[^aeiou]/i
    if char =~ /[a-z&&[^aeiou]]/i
      char * 2
    else
      char
    end
  end
  result.join
end

p double_consonants('String')
p double_consonants('String') == 'SSttrrinngg'
p double_consonants('Hello-World!')
p double_consonants('Hello-World!') == 'HHellllo-WWorrlldd!'
p double_consonants('July 4th') == 'JJullyy 4tthh'
p double_consonants('') == ''

# Other solutions
# \W means non-word character

def double_consonants2(str)
  str.chars.map! { |c| c =~ /[\d\Waeiou]/ ? c : c * 2 }.join
end

p double_consonants2('Hello-World!')
