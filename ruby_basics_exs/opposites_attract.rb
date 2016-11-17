# Opposites Attract

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num1 = ''
num2 = ''
loop do
  puts '>> Please enter a positive or negative integer:'
  num1 = gets.chomp

  puts '>> Please enter a positive or negative integer:'
  num2 = gets.chomp

  break if valid_number?(num1) && valid_number?(num2) &&
           num1.to_i * num2.to_i < 0

  if num1.to_i * num2.to_i == 0
    puts '>> Invalid input. Only non-zero integers are allowed.'
  else
    puts '>> Sorry, one integer must be positive, one must be negative.'
    puts '>> Please start over.'
  end
end

puts "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
