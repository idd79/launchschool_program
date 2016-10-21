# Combining Arrays

def merge(arr1, arr2)
  [arr1, arr2].flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Launchschool Solution

def merge2(arr1, arr2)
  arr1 | arr2
end

p merge2([1, 3, 5], [4, 3, 8, 9])
