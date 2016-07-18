# 1) Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

puts "--Ex 1."
array = (1..10).to_a
array.each { |i| puts i }


# 2) Same as above, but only print out values greater than 5.

puts "--Ex 2."
p array.select { |i| i > 5 }
puts array.select { |i| i > 5 }
puts "--or--"
array.each do |x|
  puts x if x > 5
end


# 3) Now, using the same array from #2, use the select method to extract all odd numbers into a new array.

puts "--Ex 3."
new_array = array.select { |x| x.odd? }
p new_array


# 4) Append "11" to the end of the original array. Prepend "0" to the beginning.

puts "--Ex 4."
array.push(11)
array.unshift(0)
p array


# 5) Get rid of "11" and append a "3".

puts "--Ex 5."
array.pop
array.push(3)
p array


# 6) Get rid of duplicates without specifically removing any one value.

puts "--Ex 6."
p array.uniq


# 8) Create a Hash using both Ruby syntax styles.

puts "--Ex 8."
p hash = {name: "Ivan", last_name: "Duran"}
p hash2 = {"name" => "Bob", "last_name" => "Smith"}


# 9) Suppose you have a hash h = {a:1, b:2, c:3, d:4}

puts "--Ex 9."
h = {a:1, b:2, c:3, d:4}
# Get the value of key 'b'
p h[:b]
# Add to this hash the key:value pair `{e:5}`
h[:e] = 5
p h
# Remove all key:value pairs whose value is less than 3.5
h.delete_if { |k, v| v < 3.5 }
p h


# 12) Given the following data structures. Write a program that moves the information from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

puts "--Ex 12"

def split_email(email)
  email.split("@").first
end

hash_data = Array.new

contact_data.each.with_index do |item, i|
  hash_data[i] = {email: item[0], address: item[1], phone: item[2]}
end

p hash_data

contact_data.each.with_index do |item, i|
  name = split_email(item.first)
  contacts.each do |k, v|
    if k.downcase.include?(name)
      contacts[k] = hash_data[i]
    else
      next
    end
  end
end

p contacts


# 13) Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number?

puts "--Ex 13."

p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]


# Ex 15) Use Ruby's Array method delete_if and String method start_with? to delete all of the words that begin with an "s" in the following array.

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

puts "--Ex. 15."

arr.delete_if { |item| item.start_with?("s", "w") }
p arr


# Ex. 16) Take the following array and turn it into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method.

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

new_a = a.map { |item| item.split }.flatten
p new_a
