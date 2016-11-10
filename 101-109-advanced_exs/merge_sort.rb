# Merge sort (recursive algorithm)

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

p merge_sort([9, 5, 7, 1])

# Non-recursive solution

def merge_sort2(array)
  return array if array.size == 1
  result = array.map { |elem| [elem] }

  # loop do
  while result.size > 2
    new_arr = []
    while result.size > 3
    # loop do
      # break if result.size <= 3
      pair = result.shift(2)
      new_arr << merge(pair[0], pair[1])
    end
    result = [merge(result[0], result[1]), result[2]] if result.size == 3
    result = new_arr + [merge(result[0], result[1])] unless new_arr.empty?

    # break if result.size == 2
  end
  
  merge(result[0], result[1])
end

p merge_sort2([1, 2, 8, 4, 3])
p merge_sort2([1, 2, 3])
p merge_sort2([6, 2, 7, 1, 4])
p merge_sort2(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))
p merge_sort2([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46])
p merge_sort2([7, 5, 8])
