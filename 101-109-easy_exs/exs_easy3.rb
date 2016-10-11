# Exercises Easy 3

def next_exc
  puts "-" * 5 + "Next Exercise" + "-" * 5
end

# Searching 101 (Ex. 1)

NUMBERS = %w(1st 2nd 3rd 4th 5th last).freeze

def ask_6_numbers
  numbers = []
  NUMBERS.each do |num|
    puts "==> Enter the #{num} number:"
    numbers << STDIN.gets.chomp.to_i
  end
  numbers
end

numbers = ask_6_numbers

if numbers[0...-1].include?(numbers.last)
  puts "The number #{numbers.last} appears in #{numbers[0...-1]}."
else
  puts "The number #{numbers.last} does not appear in #{numbers[0...-1]}."
end

next_exc

# Counting the number of characters (Ex. 3)

print 'Please write word or multiple words: '
string = gets.chomp

chars_count = string.chars.count { |char| char != " " }

puts "There are #{chars_count} characters in \"#{string}\"."

next_exc

# Palindromic Strings (Ex. 8)

def palindrome?(input)
  input == input.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

next_exc

# Palindrome part 2 (Ex. 9)

def real_palindrome?(string)
  string = string.downcase.chars.reject { |char| char.match(/[^a-z0-9]/) }
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
