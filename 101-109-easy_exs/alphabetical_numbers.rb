# Alphabetical numbers

nums_alpha = %w(zero one two three four five six seven eight nine ten eleven
              twelve thirteen fourteen fifteen sixteen seventeen eighteen 
              nineteen)

numbers = (0..19).to_a

HASH = numbers.zip(nums_alpha).to_h

def alphabetic_number_sort(array)
  sorted_nums = array.map { |num| HASH[num] }.sort
  sorted_nums.map { |num| HASH.key(num) }
end

p alphabetic_number_sort([3, 6, 7])
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Lauchschool solution

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort2(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end
