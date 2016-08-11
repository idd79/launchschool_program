# Exercises: Easy 3

#Q1. Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam)

# Q2. How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << "Dino"

# Q3. Add more than one element to the array above:

p flintstones.push("Dino", "Hoppy")
p flintstones.push("Dino").push("Hoppy")
p flintstones.concat(%w(Dino Hoppy))

# Q4. Remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

p advice.partition("house")[0]
p advice.slice(0, advice.index("house"))
p advice
p advice.slice!(0, advice.index("house"))
p advice

# Q5. Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

p statement.scan('t').count

# Q6. Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

p title.center(40)
