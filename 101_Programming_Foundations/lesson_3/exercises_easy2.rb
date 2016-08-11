# Exercises: Easy 2

#Q1. In the following hash, see if "Spot" is present.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")

# Q2. Add up all of the ages in the following hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.inject(:+)
p ages.values.reduce(:+)

# Q3. In the ages hash, throw out the people older than 100.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.select { |k, v| v < 100 }
p ages.reject { |k, v| v >= 100 }
p ages.keep_if { |_, v| v < 100 }

# Q4. Convert to different capitalized modes.

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.capitalize
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase

# Q5. add ages for Marilyn and Spot to the existing hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge(additional_ages)

# Q6. Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# Q7. See if "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match("Dino")

# Q8. In the array, find the index of the first name that starts with "Be".

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name[0, 2] == "Be" }

# Q9. Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |item|
  item[0, 3]
end

p flintstones

# Q10. Again, shorten each of these names to just 3 characters -- but this time do it all on one line:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }

p flintstones
