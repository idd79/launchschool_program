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
    numbers << gets.chomp.to_i
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
