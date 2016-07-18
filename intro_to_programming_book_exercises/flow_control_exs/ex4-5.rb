# Ex. 4 What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.

# 1)
'4' == 4 ? puts("TRUE") : puts("FALSE")
# it will print "FALSE"

# 2)
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
 puts "Did you get it right?"
else
 puts "Did you?"
end
# It will print "Did you get it right?"

# 3)
y = 9
x = 10
if (x + 1) <= (y)
 puts "Alright."
elsif (x + 1) >= (y)
 puts "Alright now!"
elsif (y + 1) == x
 puts "ALRIGHT NOW!"
else
 puts "Alrighty!"
end
# It will print "Alright now!"


# Ex. 5. Rewrite your program from exercise 3 using a case statement. Wrap the statement from exercise 3 in a method and wrap this new case statement in a method. Make sure they both still work.

print "Type any integer: "
ans = gets.chomp.to_i

def if_mt(ans)
  if ans < 0
    puts "The number is negative"
  elsif ans <= 50
    puts "The number is between 0 and 50"
  elsif ans <= 100
    puts "Then number is between 51 and 100"
  else
    puts "The number is greater than 100"
  end
end

def case_mt(ans)
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
end

if_mt(ans)
case_mt(ans)

