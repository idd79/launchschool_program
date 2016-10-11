# Easy 1

-   The `String#chars` to get `["1", "3", "5"]` out of `135.to_s`. Same
    as `135.to_s.split('')`.
-   Instead of using `something.map { |x| x.to_i }`, we can use
    `something.map(&:to_i)`.
-   Methods to look at:
    -   `Array#count`. This method can take a block so to count for
        example only the values that meet some criteria
    -   `Array#reverse` and `String#reverse`.
- Search about `&:method_name` construction in the Gems installed.

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
# =>  The total is $110.00
```

- Remember to use `String#chop` to remove the last character of a string.

# Easy 5

-   The method `String#ord` returns the ordinal or ascii value of a
    one-character string.
-   Similarly, the method `Integer#chr` returns the character
    represented by the value. Therefore, `char.ord.chr == chr` is
    `true`.
-   Check the `Kernel#format` method. Example to for a method that
    prints the time of the day based on the number of minutes after or
    before midnight:

```ruby
time_of_day(0) == "00:00"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(800) == "13:20"
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

-   From the above method, check as well the method `Fixnum#divmod`,
    which will return an array of size 2. For example, `800.divmod(60)`
    will return `[13, 20]`, which are the quotient and the
    modulus, respectively.

# Easy 9

- We can break a string line that is too long using `\`. Example:

```ruby
puts "This is a very long sentence that we need to break in " \
     "two lines, otherwise it won't fit the 80 character rule."
```

- We can use the `Numeric#abs` method to obtain the absolute value of a number.


# Medium 1

-   Check `Array#rotate` to rotate an array, that is, to move the first
    element to the last, and all other elements move down to index
    `i-1`.
-   Slicing an array to capture from the second element to the last:
    `array[1..-1]`.
-   We can use `downto(min)` to iterate in descending order instead of
    ascending like in `times`. For example, `5.downto(2) do |n|`. `min`
    can be a negative number.
-   We can similarly use `upto(num)` to iterate up to certain integer.
    Example: `1.upto(5)`.
-   Checkout the method `String#center`. Example: `"hello".center(9)`
    will return `' hello '` (i.e., 'hello' with two extra
    spaces around).

# Medium 2

-   We can use `none?` method (see `my_abc.rb`) to return `true` if no
    condition from the block has been met in any of the objects passed.
    Example:

```ruby
BLOCKS2.none? { |block| up_string.count(block) >= 2 }
```

- In an array, we can get the minimum value with the method `Array#min`, or the lowest numbers, for example `a.min(2)` will return an array with the lowest two numbers (can compare between strings as well). 
- Remember to use `reduce` or `inject` to sum (or perform any other operation) across the elements of an array. For example `a.reduce(:+)`.

# Advanced 1

- Checkout the methods on how to transpose and rotate a matrix (90, 180, 260, and 360 degrees).
- Similar to `each` to iterate over the elements of an object such an array, we can use the `reverse_each` to iterate but in the opposite order. That is, it will start with the last element instead of the first.
- Also, we can use the `Array#reverse` method to reverse the elements of an array. Example:

```ruby
a = [1, 2, 3]
a.reverse

# => [3, 2, 1]
```
