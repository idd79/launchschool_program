# Ex. 1) Below we have given you an array and a number. Write a program that checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

def appears?(array, number)
  appears = array.include?(number)
  if appears
    puts "The number #{number} is in the array #{array}"
  else
    puts "The number #{number} is NOT in the array #{array}"
  end
end

appears?(arr, number)


# Ex. 3) How do you print the word "example" from the following array?

arr = [["test", "hello", "world"],["example", "mem"]]

p arr[1][0]
p arr.last.first


# Ex. 6) 

names = ['bob', 'joe', 'susan', 'margaret']
names[names.index('margaret')] = 'jody'
p names


# Ex. 7) Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, the original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.

arr = [1, 3, 5, 7, 9, 11]

# new_arr = arr.map { |x| x + 2 }
# new_arr2 = arr.collect { |x| x + 2 }

# p arr
# p new_arr
# p new_arr2

new_arr = Array.new

arr.each do |x|
  # new_arr << x + 2
  new_arr.push(x + 2)
end

p arr
p new_arr

