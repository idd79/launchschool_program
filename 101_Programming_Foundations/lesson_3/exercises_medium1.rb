# Exercises: Medium 1

#Q1. write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

string = "The Flintstones Rock!"

10.times { |i| puts " " * i + string }

# Q2. Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

hash = {}
statement.split("").reject { |i| i == " " }.sort.each do |letter|
  hash[letter] = hash.fetch(letter, 0) + 1
end

p hash

# or,

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

# Q3.

# Fix this statement: puts "the value of 40 + 2 is " + (40 + 2)

puts "the value of 40 + 2 is #{(40 + 2)}"  # or,
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Q4. What would be put by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# What would be put by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Q5. Calculate the factors of a positive number

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(525)
p factors(-23)
p factors(0)

# Q8. Write your own version of the rails titleize implementation (a method that creates a string that has each word capitalized as it would be in a title).

def titleize(string)
  string.split.map! { |word| word.capitalize }.join(" ")
end

string = "hello world!"
p titleize(string)

# Q9.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, v|
  if v["age"] < 18
    v["age_group"] = "kid"
  elsif v["age"] < 65
    v["age_group"] = "adult"
  else
    v["age_group"] = "senior"
  end
end

p munsters

munsters.each do |_, v|
  case v["age"]
  when (0..17)
    v["age_group"] = "kid"
  when 18..64
    v["age_group"] = "adult"
  else
    v["age_group"] = "senior"
  end
end

p munsters
