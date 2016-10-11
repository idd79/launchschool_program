# Easy 2 exercises for 101-109

def next_exc
  puts "-" * 5 + "Next Exercise" + "-" * 5
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
