# Fizzbuzz

def fizzbuzz(num1, num2)
  array = num1.upto(num2).map do |num|
    if num % 15 == 0 then 'FizzBuzz'
    elsif num % 3 == 0 then 'Fizz'
    elsif num % 5 == 0 then 'Buzz'
    else num
    end
  end
  array.join(', ')
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
