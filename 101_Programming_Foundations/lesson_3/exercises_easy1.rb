# Exercises Easy 1

# Q1. What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# Q3. Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub("important", "urgent")

# Q4. What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
numbers.delete(1)

# Q5. Programmatically determine if 42 lies between 10 and 100.
# Hint: Use Ruby's range object in your solution.

(10..100).cover?(42)

# Q6. Starting with the string below, show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

new_string = "Four score and " + famous_words

new_string2 = "Four score and " << famous_words

new_string3 = famous_words.prepend("Four score and ")

# Q7

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)

# Q8. Make the nested array into and un-nested array

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

# Q9. Convert the hash into an array containing only two elements: Barney's name and Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.keep_if { |k, v| k == "Barney"}.to_a.flatten!
flintstones.assoc("Barney")

# Q10. Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each.with_index { |item, index| hash[item] = index }
p hash

