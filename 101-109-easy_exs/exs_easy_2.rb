# Easy 2 exercises for 101-109

def next_exc
  puts '-' * 5 + 'Next Exercise' + '-' * 5
end

# How old is Teddy? (Ex. 1)

puts "Teddy is #{(20..200).to_a.sample} years old!"

print "What's your name? "
name = gets.chomp

def display_name(name = 'Teddy')
  puts "#{name} is #{(20..200).to_a.sample} years old!"
end

name.empty? ? display_name : display_name(name)

next_exc

# Tip calculator (Ex. 3)

print 'What is the bill? '
bill = gets.chomp.to_f

print 'What is the tip percentage? '
tip = gets.chomp.to_f

tip = tip / 100 * bill
total = bill + tip

puts "The tip is $#{format('%.2f', tip)}"
puts "The total is $#{format('%.2f', total)}"

next_exc

# When will I retire? (Ex. 4)

print 'What is your age? '
current_age = gets.to_i

print 'At what age would you like to retire? '
retirement_age = gets.to_i

current_year = Time.now.year
work_years_to_go = retirement_age - current_age
retirement_year = current_year + work_years_to_go

puts "It's #{current_year}. You will retire in #{retirement_year}. "
puts  "You have only #{work_years_to_go} years of work to go!"

next_exc

# Greeting User (Ex. 5)

print "What's your name? "
name = gets.chomp

if name[-1] == '!'
  puts "hello #{name.chop}, why are we screaming?".upcase
else
  puts "Hello #{name}."
end

next_exc

# Print Odd Numbers (Ex. 6)

(1..99).each { |num| puts num if num.odd? }

# Print Odd Numbers (Ex. 7)

puts (1..99).select { |num| num % 2 == 0 }

next_exc

# Sum or Product of Consecutive Integers (Ex. 8)

puts 'Please enter an integer greater than 0:'
num = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product:"
operation = gets.chomp

case operation
when 's'
  result = (1..num).reduce(0, :+)
  puts "The sum of the integers between 1 and #{num} is #{result}"
when 'p'
  result = (1..num).reduce(1, :*)
  puts "The product of the integers between 1 and #{num} is #{result}"
else
  puts 'Operation not recognized'
end

next_exc

# Mutation (Ex. 10)

# What will the following code print, and why? Don't run the code until you
# have tried to answer.

array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C') }
puts array2

# How can this feature of ruby get you in trouble? How can you avoid it?
# Ans: reasing array1...

array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1 = array1.map { |value| value.upcase! if value.start_with?('C') }
puts array2
