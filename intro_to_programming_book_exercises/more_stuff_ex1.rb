# Write a program that checks if the sequence of characters "lab" exists 
# in the following strings. If it does exist, print out the word.

words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

def check_string(string, word, ignore_case=false)
  if ignore_case
    puts "#{word}" if word.downcase.include?(string.downcase)
  elsif !ignore_case
    puts "#{word}" if word.include?(string) 
  end
end

# check_string("Ll", "hello", true)
# check_string("Ll", "hello")

words.each { |word| check_string("lab", word) }
puts "---Ignoring case---"
words.each { |word| check_string("lab", word, true) }

# Using Regex

def check_string2(string, word, ignore_case=false)
  if ignore_case
    puts (/lab/i =~ word) ? word : "No match!"
  elsif !ignore_case
    puts (/lab/ =~ word) ? word : "No match!"
  end
end

words.each { |word| check_string2("lab", word) }
puts "---Ignoring case---"
words.each { |word| check_string2("lab", word, true) }
