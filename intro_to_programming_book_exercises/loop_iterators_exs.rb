# Ex 2. Write a while loop that takes input from the user, performs an action,
# and only stops when the user types "STOP". Each loop can get info from the user.

condition = true

while condition
  puts "This will keep going on..."
  print "Type STOP if you don't want to continue: "
  answer = gets.chomp
  if answer == "STOP"
    condition = false
  end
end

# Ex 3. Use the each_with_index method to iterate through an array of your 
# creation that prints each index and value of the array.

a = [1, 9, 7, 9, 0, 2, 2, 1]

p a.each_with_index { |value, index| puts "Index: #{index}, Value: #{value}" }


# Ex 4. Write a method that counts down to zero using recursion.

def count_down(number)
  if number >= 0
    puts number
    count_down(number - 1)
  end
end

count_down(10)
count_down(-10)
