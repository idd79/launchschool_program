# coding: utf-8
# Exercises: Hard 1

# Q1. What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

p greeting

# Q2. What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Q3. What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Q4. Write a method that returns one UUID when called with no parameters.

require "SecureRandom"

def uuid_generator()
  SecureRandom.uuid
end

p uuid_generator()

def generate_uuid()
  characters = ("a".."f").to_a + ("0".."9").to_a

  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each.with_index do |item, index|
    item.times { uuid += characters.sample }
    uuid += "-" unless index == sections.length - 1
  end

  uuid
end

p generate_uuid()

# Q5. Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_a_number? to determine if a string is a number and asked Ben to use it.
# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)." Help Ben fix his code.

def is_a_number?(number)
  number.match(/^\d*$/)
end

# My solution
def dot_separated_ip_address?(input_string)
  condition = true
  condition = false unless input_string.count('.') == 3

  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    condition = false if !is_a_number?(word)
  end

  condition
end

# Launchschool solution
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end

