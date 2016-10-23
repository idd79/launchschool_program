# Multiply lists

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |item| item.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11])
