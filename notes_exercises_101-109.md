# Ruby 101-109 Small Problems

# Easy 1

-   Use `String#chars` to get `["1", "3", "5"]` out of `135.to_s`. Same as `135.to_s.split('')`.
-   Instead of using `something.map { |x| x.to_i }`, we can use
`something.map(&:to_i)`.
- Methods to look at:
  - `Array#count`. This method can take a block so to count for example only the values that meet some criteria
  - `Array#reverse` and `String#reverse`.

### TODO:
* [ ] Search about `&:method_name` construction in the Gems installed.

# Easy 2

- We can generate a random number between an interval in at least two ways:

```ruby
number = rand(20..200)
number = (20..200).to_a.sample
```

- We can check if a string is empty with the `String#empty?` method. Example: `"".empty?` will return `true`.

- We can use `Kernel#format` to display a number with two digits. Example:

```ruby
puts "The tip is $#{format('%.2f', 10)}"
puts "The total is $#{format('%.2f', 100)}"

# => The tip is $10.00
# => The total is $110.00
```

- Remember to use `String#chop` to remove the last character of a string.

# Easy 3

- When using the `*` operator on an array, the result is similar as when we use it in a `string`. That is:

```ruby
'hi' * 3 # => 'hihihi'
[1, 2] * 3 # => [1, 2, 1, 2, 1, 2]
```

- Just like `map` has its counterpart `map.with_index`, `select` and `reject` have also `select.with_index` and `reject.with_index`.

- We can use the `Date` class in order to check whether a year is a leap year. Example:

```ruby
require 'date'

def leap_year?(year)
  Date.new(year, 1, 1, Date::GREGORIAN).leap?
end
```

- Alternatively, we could check in the following way:

```ruby
Date.gregorian_leap?(1900)        #=> false
Date.gregorian_leap?(2000)        #=> true
```

# Easy 4

- In a `case` statement, we can use different conditions in the `when` clause by separating them with comma. Example:

```ruby
case number
when 5
  'something'
when 4, 7..9
  'else'
else
  '...'
end
```

- We can use the __spaceship__ operator `<=>` to compare two objects and return either `+1` or `-1`. E.g. `number <=> 0`. If `number` is greater than `0`, then `1` is returned, if `number` is less than `0`, it will return `-1`. It will return `0` if the values are the same.

# Easy 5

-   The method `String#ord` returns the ordinal or ascii value of a one-character string.
-   Similarly, the method `Integer#chr` returns the character represented by the value. Therefore, `char.ord.chr == chr` is `true`.
-   Check the `Kernel#format` method. Example of a method that prints the time of the day based on the number of minutes after or before midnight:

```ruby
time_of_day(0)     == "00:00"
time_of_day(35)    == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(800)   == "13:20"
time_of_day(-4231) == "01:29"
```

The method to obtain the above can be something like:

```ruby
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
```

-   From the above method, check as well the method `Fixnum#divmod`, which will return an array of size 2. For example, `800.divmod(60)`will return `[13, 20]`, which are the quotient and the modulus, respectively.

- Use the `squeeze` method whenever we want to get rid of characters that are repeated consecutively. Example:

```ruby
"we    like    food".squeeze(' ')
# => "we like food"
```

- The expression `/[^a-z]/i` is a regular expression that matches any character that is not an uppercase or lowercase letter. The `/i` part of this expression is what makes this expression case insensitive.

- We can initialize a `Hash` with a given predetermined value, so when we call a `Hash` key for the first time it doesn't return an error. We can use for example `Hash.new(0)` so every new key initializes to `zero`, or `Hash.new('Go fish')`. An alternative way is to use the `fetch` method. e.g. `hash.fetch(key, 0)`.

- We can use the `String#count` method to count for the number of characters that match certain expression. For example, `"hello!".count "a-zA-Z"` will count 5 letters as it omits the `!` sign. Similarly, we can use the `String#delete` method in the same fashion, that is `"hello!".delete("^A-Za-z")` will delete the `!` sign from the string and returns the new string, in this case `hello`.

- We can use two arrays to create a `Hash`, one of the arrays being the keys, and the other one being the values. Example:

```ruby
a1 = [0, 1, 2]
a2 = ['zero', 'one', 'two']
# two ways to combine them into a Hash:
Hash[a1.zip(a2)]
a1.zip(a2).to_h
# => {0=>"zero", 1=>"one", 2=>"two"}
```

- In the previous example we also use the `Array#zip` method to combine two array. Example:

```ruby
a1 = [0, 1, 2]
a2 = ['zero', 'one', 'two']
a1.zip(a2)
# => [[0, "zero"], [1, "one"], [2, "two"]]
```

- Use the `String#ljust`, `String#rjust`, and `String#center` to justify text withing certain number of spaces. Examples:

```ruby
'hello'.center(20)
'hello'rjust(20)
'hello'.ljust(20)
```

# Easy 6

- Remember parallel assignment which is a ruby idiom for exchanging two values without requiring an intermediate variable. Example:

```ruby
array[left_index], array[right_index] = array[right_index], array[left_index]
```

- Three different ways of solving a problem, in this case reversing an array (without using the `Array#reverse` method). We use in this case `reverse_each`, `each_with_object`, and `inject`:

```ruby
def reverse(array)
  new_array = []
  array.reverse_each { |item| new_array << item }
  new_array
end

def reverse2(array)
  array.each_with_object([]) { |item, new_array| new_array.unshift(item) }
end

def reverse3(array)
  array.reverse_each.inject([]) { |new_array, item| new_array << item }
end
```

- Observe that both `each_with_object` and `inject` methods return a new object, in this case a new `array`.

- There is an `array` method called `Array#|` which returns the set union of two arrays, removing any duplicates. Example:

```ruby
def merge(array_1, array_2)
  array_1 | array_2
end

merge([1, 3, 4], [3, 6, 9]) # => [1, 3, 5, 6, 9]
```

- Similarly, `Array#&` returns the set interception of two arrays.

```ruby
a1 = [1, 2, 3]
a2 = [2, 3, 5]
a1 & a2 # => [2, 3]
```

- We can use the `Enumerable#find`, `Enumerable#find_all`, and `Enumerable#find_index` to find the elements that meet certain condition(s) given by a block. Example:

```ruby
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end
```

- In the example above, `find` finds the first element in the array that meets the condition.

- The method `Array#rindex(val)` returns the index of the last value in the array that is equal to `val`, as opposed to `Array#index` that returns the first value.

- In the following example, the `!!` force the return value to be `true` or `false`, as otherwise would be a number (the index) or `nil`:

```ruby
def include2?(array, value)
  !!array.find_index(value)
end
```

# Easy 7

- Example of using `count` with a block:

```ruby
counts = {}
characters = string.chars
counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
```

- The fellowing methods are equivalent and show a concise way to use an iterator method such as `map`:

```ruby
def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# It's equivalent to

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end
```

- In general, the form `(&:method)` is a shorthand for saying `{ |item| item.method }`.

# Easy 8

- Use the `String#slice` method to return substrings out of a string. E.g. `hello.slice(0..2) # => 'hel'`.

- Use the `Array#concat` to concatenate two arrays. E.g. `["a", "b"].concat( ["c", "d"] ) #=> ["a", "b", "c", "d"]`.

# Easy 9

- We can break a string line that is too long using `\`. Example:

```ruby
puts "This is a very long sentence that we need to break in " \
     "two lines, otherwise it won't fit the 80 character rule."
```

- We can use the `Numeric#abs` method to obtain the absolute value of a number.

# Medium 1

- Check `Array#rotate` to rotate an array, that is, to move the first element to the last, and all other elements move down to index `i-1`.
-   Slicing an array to capture from the second element to the last: `array[1..-1]`.
- We can use `downto(min)` to iterate in descending order instead of ascending like in `times`. For example, `5.downto(2) do |n|`. `min` can be a negative number.
- We can similarly use `upto(num)` to iterate up to certain integer. Example: `1.upto(5)`.
- Checkout the method `String#center`. Example: `"hello".center(9)` will return `' hello '` (i.e., 'hello' with two extra spaces around).

- Example of substituting numbers in words to digits using regex:

```ruby
NUMS = {"zero" => "0", "one" => "1", "two" => "2", "three" => "3",
        "four" => "4", "five" => "5", "six" => "6", "seven" => "7",
        "eight" => "8", "nine" => "9"}.freeze

def word_to_digit(string)
  string.gsub(/#{NUMS.keys.join("|")}/, NUMS)
end
```

- According to the example above, we can use a `hash` as replacement object, in this case `NUMS`.

- Another Regex example to to format the numbers within a sentence:

```ruby
string.gsub(/(\d{3})(\d{3})(\d{4})/) {
  format("(%d) %d-%d", "#{$1}", "#{$2}", "#{$3}")
}

# or

string.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')

# Will return:
"Please call me at (555) 123-4567. Thanks."
# The original string was:
"Please call me at 5551234567. Thanks."
```


# Medium 2

- We can use `none?` method (see `my_abc.rb`) to return `true` if no condition from the block has been met in any of the objects passed. Example:

```ruby
BLOCKS2.none? { |block| up_string.count(block) >= 2 }
```

- In an array, we can get the minimum value with the method `Array#min`, or the lowest numbers, for example `a.min(2)` will return an array with the lowest two numbers (can compare between strings as well). 
- Remember to use `reduce` or `inject` to sum (or perform any other operation) across the elements of an array. For example `a.reduce(:+)`.
- Example of using the `splat` operator as a method argument:

```ruby
def triangle(*args)
  return :invalid if args.inject(:+) != 180 || args.any? { |a| a <= 0}
  args.include?(90) ? :right : args.any? { |a| a > 90} ? :obtuse : :acute
end
```

- `args` in the example above is actually an array given the name `args`, so we can operate on `args` just like we would on any array.

- A similar example to solve the same problem as above using `splat` in the second method, in this case, taking the arguments from an array:

```ruby
def valid_triangle?(a1, a2, a3)
  angles = [a1, a2, a3]
  angles.reduce(:+) == 180 && angles.all? { |x| x > 0 }
end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid unless valid_triangle?(*angles)

  if angles.any? { |a| a == 90 }
    :right
  elsif angles.all? { |a| a < 90 }
    :acute
  elsif angles.any? { |a| a > 90 }
    :obtuse
  end
end
```

- We can remove the consecutive repeated characters from a string using regex (also if we convert the string to an array and then use the `uniq` method):

```ruby
'aaabcaddd'.gsub(/(.)\1+/, '\1')
# => "abcad" 
```


# Advanced 1

- Checkout the methods on how to transpose and rotate a matrix (90, 180, 260, and 360 degrees).
- Similar to `each` to iterate over the elements of an `array` such an array, we can use the `Array#reverse_each` to iterate but in the opposite order. That is, it will start with the last element instead of the first.
- Also, we can use the `Array#reverse` method to reverse the elements of an array (it also applies to `strings`). Example:

```ruby
a = [1, 2, 3]
a.reverse

# => [3, 2, 1]
```

- Madlibs exercise. Read from a file and insert random text in each line:

```ruby
# Example data:

The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

# Solution

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end
```

- Note that the format placeholders use `%{name}`, not `#{name}`: the latter is interpolation, which differs from the type of substitution performed by format.


# Miscellaneous

- In order to iterate step by step by, similar to `upto` but being able to define or control how big the steps are, we can use `step`. Example: 

```ruby
1.step(10, 2) { |x| puts x }

# Will print
1
3
5
7
9
```

- Iterate through an `array` (or `range`) using `for`:

```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends # in a range we can use => i in 0..num
  puts "Hello, #{friend}!"
end
```

- To check whether a number is withing certain range (inclusive), we can use either `between?`, `include?` or `cover?` methods. Examples:

```ruby
0.between?(0, 10) # => true
(0..10).cover?(10) # => true
```

- Examples using `Kernel#format`:

```ruby
format("%4.3s", "Lisa") # => “ Lis”
format("$% .2f", "37.94") # => "$ 37.94"
format("%010.2e", "123_456") # => "001.23e+05”
format("%02d:%02d", "3", "5") # => "03:05"
```

