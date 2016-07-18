# Ex2. Write a method that takes a string as argument. The method should return the all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)

def all_caps(string)
  string.length > 10 ? string.upcase : string
end

w1 = all_caps("nothing")
w2 = all_caps("hello world")

puts w1
puts w2

