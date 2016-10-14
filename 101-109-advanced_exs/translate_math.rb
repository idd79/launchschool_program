def translate_math(string)
  array = string.split
  numbers = %w(zero one two three four five six seven eight nine)
  new_numbers = {}
  numbers.each_with_index { |num, i| new_numbers[num] = i }
  array.map!.with_index do |x, i|
    i.even? ? new_numbers[x] : x
  end
  array
end

def operation(array)
  case array[1]
  when 'plus' then array[0] + array[2]
  when 'minus' then array[0] - array[2]
  end
end

def calculate(array)
  results = 0
  while array.length >= 3
    calculation = operation(array.shift(3))
    results = calculation
    array.unshift(results)
  end
  results
end

def english_math(string)
  string.gsub!('divided by', 'divided')
  array = translate_math(string)

  while array.include?('times')
    i = array.index('times')
    operation = array.slice!((i - 1)..(i + 1))
    num = operation[0] * operation[2]
    array.insert(i - 1, num)
  end

  while array.include?('divided')
    i = array.index('divided')
    operation = array.slice!((i - 1)..(i + 1))
    num = operation[0] / operation[2]
    array.insert(i - 1, num)
  end
  calculate(array)
end

p english_math('three times four minus six divided by three plus five') # => 15
p english_math('three plus four minus six divided by three plus five') # => 10
