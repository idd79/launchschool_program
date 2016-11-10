# Merge sorted lists

require 'pry'

def merge(a1, a2)
  arrays = [a1, a2].sort_by(&:size)
  return arrays.last if arrays.any?(&:empty?)
  result = []
  init_ind = 0
  a2.each do |elem|
    if a1[init_ind] >= elem
      result << elem
    else
      ind = init_ind >= a1.size - 1 ? a1.size - 1 : init_ind
      loop do
        break if ind == a1.size - 1 || (a1[ind] < elem &&
                                        a1[ind] < a1[ind + 1])
        ind += 1
      end
      result += a1[init_ind..ind] + [elem]
      init_ind = ind + 1
    end
  end
  result + a1[init_ind..-1]
end

# Launchschool solution

def merge2(array1, array2)
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

p merge([1, 5, 8], [2, 3, 4])
p merge([1, 5], [2, 3, 4])
p merge([1, 5, 9], [2, 6, 8])
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2])
p merge([2, 2], [1, 1, 3])
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p merge([8, 10, 20, 20], [4, 4, 10, 15, 17])
