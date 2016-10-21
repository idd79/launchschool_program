# Fibonacci number location by length

def find_fibonacci_index_by_length(digits)
  fib1 = 5
  fib2 = 8
  count = 7
  loop do
    puts fib_next = fib1 + fib2
    break if fib_next.to_s.size >= digits
    count += 1
    fib1, fib2 = fib2, fib_next
  end
   count
end

p find_fibonacci_index_by_length(2)     == 7
p find_fibonacci_index_by_length(10)    == 45
p find_fibonacci_index_by_length(100)   == 476
p find_fibonacci_index_by_length(1000)  == 4782
p find_fibonacci_index_by_length(10000) == 47847
