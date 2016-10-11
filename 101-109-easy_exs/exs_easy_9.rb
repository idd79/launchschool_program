# Easy 9 exercises for 101-109

def next_exc
  puts "-" * 5 + "Next Exercise" + "-" * 5
end

# Welcome stranger (Ex.1)

def greetings(name, options = {})
  puts "Hello, #{name.join(' ')}! Nice to have a " \
       "#{options[:title]} #{options[:occupation]}"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

next_exc

# Double Doubles (Ex. 2)

def twice(number)
  number_size = number.to_s.size.to_f
  array = number.to_s.chars
  return number if array[0...(number_size / 2)] == array[(number_size / 2)..-1]
  number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

next_exc

# Always return negative (Ex. 3)

def negative(number)
  number <= 0 ? number : number * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
p negative(0)

next_exc

# Counting up (Ex. 4)

def sequence(int)
  (1..int).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

next_exc

# Uppercase Check (Ex. 5)

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
