# Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

print "Type any integer: "
ans = gets.chomp.to_i

case 
when ans < 0
  puts "The number is negative"
when ans <= 50
  puts "The number is between 0 and 50"
when ans <= 100
  puts "Then number is between 51 and 100"
else
  puts "The number is greater than 100"
end
