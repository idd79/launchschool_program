# Fibonacci numbers

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

def fibonacci(num)
  return 1 if num == 1 || num == 2
  fibonacci(num - 1) + fibonacci(num - 2)
end

# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(20)

def fibonacci_no_recurs(num)
  array = [1, 1]
  3.upto(num) do
    array[2] = array[0] + array [1]
    array[0] = array[1]
    array[1] = array[2]
  end
  array[2]
end

def fibonacci_launshcool(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

# p fibonacci_no_recurs(20)
# p fibonacci_no_recurs(100)
# p fibonacci_no_recurs(100_001)

def fib_last_digit(num)
  array = ['1', '1']
  3.upto(num) do
    array[2] = array[0][-1].to_i + array [1][-1].to_i
    array[0] = array[1].to_s[-1]
    array[1] = array[2].to_s[-1]
  end
  return 1 if num <= 2
  array[2].to_s[-1].to_i
end

# p fib_last_digit(100_001)
# p fib_last_digit(1_000_007) # -> 3 (this is a 208989 digit number)
# p fib_last_digit(123456789) # -> 4

fib_last_first_60 = []
1.upto(60) { |x| fib_last_first_60 << fib_last_digit(x) }
p fib_last_first_60

def fibonacci_last(nth)
  fib_last_first_60 = []
  1.upto(60) { |x| fib_last_first_60 << fib_last_digit(x) }

  fib_last_first_60[(nth % 60) - 1]
end

p fibonacci_last(100_001)   # -> 1
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123_456_789) # -> 4
p fibonacci_last(123_456_789_987_745)  # -> 5
p fibonacci_last(10) # -> 5
