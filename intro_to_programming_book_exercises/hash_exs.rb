# Ex. 1) Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only immediate family members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immdiate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end

p immdiate_family.values.flatten


# Ex. 2) Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.

# merge! mutates the initial hash, while merge does not, only returns the new merged hash.

other_family = { cousins: ["iman", "ibrahim", "ismail"] }

p family.merge(other_family) == family    # false

p family.merge!(other_family) == family   # true


# Ex. 3) Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

def only_keys(hash)
  puts hash.keys
  # can use the each_key method as well
end

def only_values(hash)
  puts hash.values
  # can use the each_value method as well
end

def both(hash)
  hash.each do |k, v|
    puts "Key: #{k}, Value: #{v}"
  end
end

only_keys(family)
only_values(family)
both(family)

# Ex. 4) 1. Given the following expression, how would you access the name of the person?

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

p person[:name]

# Ex. 5) What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.

# We can use the has_value? method

p other_family.has_value?("iman")   # false
p other_family.values.flatten.include?("iman")    # true

# Ex. 6) Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order.

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def sort_string(string)
  string.split('').sort.join
end

def arrange(array)
  hash = {}
  array.each do |x|
    if hash.has_key?(sort_string(x).to_sym)
      hash[sort_string(x).to_sym] << x
    else
      hash[sort_string(x).to_sym] = []
      hash[sort_string(x).to_sym] << x
    end
  end
  return hash
end

def arrange_better(array)
  hash = {}
  array.each do |x|
    hash[sort_string(x).to_sym] = hash.fetch(sort_string(x).to_sym, []).push(x)
  end
  return hash
end


arrange(words).values.each { |x| p x }
p arrange_better(words)
arrange_better(words).values.each { |x| p x }
