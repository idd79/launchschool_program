# 1. Add two strings together that, when concatenated, return your first and last name as your full name in one string.

first = "Ivan"
last = "Duran"

full_name = first + " " + last
puts "--Ex. 1--"
p full_name


# 2. Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the:
  # 1) thousands place
  # 2) hundreds place
  # 3) tens place
  # 4) ones place 

puts "--Ex. 2--"

number = 4856
p number / 1000
p (number % 1000) / 100
p (number % 100) / 10
p number % 10

# 3. Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.
# 1975
# 2004
# 2013
# 2001
# 1981

h = {m1: 1975, m2: 2004, :m3 => 2013, :m4 => 2001, m5: 1981}
puts "--Ex. 3--"
puts h[:m1]
puts h[:m2]
puts h[:m3]
puts h[:m4]
puts h[:m5]
# or,
h.each_value { |x| puts x }

# 4. Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.

puts "--Ex. 4--"
a = [1975, 2004, 2013, 2001, 1981]
puts a


# 5. Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

seed = 1*2*3*4
puts "--Ex. 5--"
p fac_5 = seed*5
p fac_6 = fac_5*6
p fac_7 = fac_6*7
p fac_7*8


# 6. Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.

puts "--Ex. 6--"
puts 2.0**2
puts 3.5**2
puts 7.8**2


# 7. What does the following error message tell you?
#     SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
      # from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

puts "--Ex. 7--"
puts "It tells you that you that you used ) instead of }."
