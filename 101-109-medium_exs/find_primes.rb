# Find primes withing a range

def is_prime?(num)
  num = num.abs
  (2...num).each do |x|
    return false if (num % x).zero?
  end
  true
end

def return_primes(num1, num2)
  (num1..num2).select { |num| is_prime?(num) }
end

p return_primes(3, 10)
p return_primes(1, 2)
p return_primes(-10, 10)
