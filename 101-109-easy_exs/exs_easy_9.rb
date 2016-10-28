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

next_exc

# Sequence count (Ex. 8)

def sequence(count, num)
  (1..count).map { |index| num * index }
end

p sequence(5, 1)
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

next_exc

# Grade book (Ex. 9)

GRADE_LETTER = { 0...60  => 'F',
                 60...70 => 'D',
                 70...80 => 'C',
                 80...90 => 'B',
                 90..100 => 'A' }.freeze

def get_grade(*grades)
  return 'Incorrect value as argument.' if grades.any? { |x| x > 100 || x < 0 }
  average = grades.reduce(0, :+).to_f / grades.size
  GRADE_LETTER.each do |range, grade|
    return grade if range.cover?(average)
  end
end

 # Or

 def get_grade2(s1, s2, s3)
   result = (s1 + s2 + s3) / 3

   case result
   when 90..100 then 'A'
   when 80..89  then 'B'
   when 70..79  then 'C'
   when 60..69  then 'D'
   else              'F'
   end
 end

p get_grade(5, 50, 33)
p get_grade(95, 90, 93)
p get_grade(95, 90, 105)
p get_grade(95, 90, -3)
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

next_exc

# Grocery list (Ex. 10)

def buy_fruit(array)
  array.map { |item, count| Array.new(count, item) }.flatten
end

# or

def buy_fruit2(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
