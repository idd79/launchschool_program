# Halvsies

def halvsies(array)
  mid_point = (array.size.to_f / 2).round
  [array[0...mid_point], array[mid_point..-1]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
