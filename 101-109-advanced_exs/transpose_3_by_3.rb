# Transpose of a 3x3 matrix
# Actually any square matrix

def transpose(matrix)
  new_matrix = Array.new(matrix.size, [])
  matrix.each do |row|
    row.each_with_index { |x, j| new_matrix[j] += [x] }
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

p m = [[1, 2], [3, 4]]
p transpose(m)

p n = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10],
       [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]]
p transpose(n)

def transpose!(matrix)
  size = matrix.size - 1
  0.upto(size - 1) do |i|
    (i + 1).upto(size) do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end

m = [[1, 2, 3, 4, 5],
     [1, 2, 3, 4, 5],
     [1, 2, 3, 4, 5],
     [1, 2, 3, 4, 5],
     [1, 2, 3, 4, 5]]

p m
new_matrix = transpose(m)
p new_matrix
transpose!(m)
p m
p new_matrix == m
