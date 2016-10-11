# Transpose any MxN matrix

def transpose(matrix)
  col_size = matrix.first.size
  new_matrix = Array.new(col_size, [])
  matrix.each do |row|
    row.each_with_index do |x, j|
      new_matrix[j] += [x]
    end
  end
  new_matrix
end

m1 = [[1, 2, 3]]
p transpose(m1)

m2 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p transpose(m2)
p m2

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == 
            [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
