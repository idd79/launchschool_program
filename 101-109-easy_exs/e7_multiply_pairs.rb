# Multiply all pairs

def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each { |num| result << arr2.map { |n| n * num } }
  result.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
