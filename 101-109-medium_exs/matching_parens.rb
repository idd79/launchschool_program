# Check if all parenthesis are balanced

require 'pry'

def balanced?(string)
  lpi = []
  string.chars.each_with_index { |x, i| lpi << i if x == '(' }
  rpi = []
  string.chars.each_with_index { |x, i| rpi << i if x == ')' }
  return false unless lpi.size == rpi.size
  (0...lpi.size).all? { |i| lpi[i] < rpi[i] }
end

def balanced_2?(string)
  lparens = ['(', '{', '[']
  rparens = [')', '}', ']']
  parens = { '(' => 0, '{' => 0, '[' => 0,
             ')' => 0, '}' => 0, ']' => 0 }
  pairs = {}
  string.each_char do |char|
    parens[char] += 1 if lparens.include?(char)
    parens[char] -= 1 if rparens.include?(char)
    pairs = { '1' => parens['('] + parens[')'],
              '2' => parens['{'] + parens['}'],
              '3' => parens['['] + parens[']'] }
    break if pairs.values.any? { |x| x < 0 }
  end

  pairs.values.all? { |x| x == 0 } && string.count("\'").even? &&
  string.count("\"").even?
end

p balanced_2?('(xxxx (xxxxxx )(') == false
p balanced_2?('What (is) this?') == true
p balanced_2?('What is) this?') == false
p balanced_2?('What (is this?') == false
p balanced_2?('((What) (is this))?') == true
p balanced_2?('((What)) (is this))?') == false
p balanced_2?('Hey!') == true
p balanced_2?(')Hey!(') == false
p balanced_2?('What ((is))) up(') == false

# Launchschool answer

# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end

p balanced_2?('(hey) and }no{') == false
p balanced_2?('(\'h) a {\'n}') == true
p balanced_2?('(hey)((}{ and {no}))') == false
p balanced_2?("(hey)((}{ \"and\" {no}))") == false
puts "'h'\"n\""
p balanced_2?("'h'\"n\"") == true
