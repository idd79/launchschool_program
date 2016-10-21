# Reverse Arrays (Part 1)

def reverse!(array)
  (array.size - 1).times do |index|
    last = array.pop
    array.insert(index, last)
  end
  array
end

p reverse!([1, 2, 3, 4])

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []

# Reverse Arrays (Part 2)

def reverse(array)
  new_array = []
  array.reverse_each { |item| new_array << item }
  new_array
end

p reverse([1, 2, 3, 4])

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                       # => [1, 2, 3]
new_list = reverse(list)               # => [3, 2, 1]
p list.object_id != new_list.object_id # => true
p list == [1, 2, 3]                    # => true
p new_list == [3, 2, 1]                # => true

def reverse2(array)
  array.each_with_object([]) { |item, new_array| new_array.unshift(item) }
end

p reverse2([1, 2, 3, 4])
list = [1, 2, 3]                       # => [1, 2, 3]
new_list = reverse2(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id # => true
p list == [1, 2, 3]                    # => true
p new_list == [3, 2, 1]                # => true

def reverse3(array)
  array.reverse_each.inject([]) { |new_array, item| new_array << item }
end

p reverse3([1, 2, 3, 4])
list = [1, 2, 3]                       # => [1, 2, 3]
new_list = reverse3(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id # => true
p list == [1, 2, 3]                    # => true
p new_list == [3, 2, 1]                # => true
