# Ex. 1 
# Write a program that prints a greeting message. This program should contain a method called greeting that takes a name as its parameter and returns a string.

def greeting(name)
  "Hello " + name
end

puts "--Ex. 1--"
p greeting("John")


# Ex. 3
# Write a program that includes a method called multiply that takes two arguments and returns the product of the two numbers.

def multiply(a, b)
  a * b
end

product = multiply(2, 3)
puts "--Ex. 3--"
puts product

# Ex. 5
# 1) Edit the method in exercise #4 so that it does print words on the screen. 2) What does it return now?

def scream(words)
  words = words + "!!!"
  puts words
end

puts "--Ex. 5--"
scream("Yippeee")
# Still returns nil as puts returns nil.
