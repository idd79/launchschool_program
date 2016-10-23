# Multiplicative average

def show_multiplicative_average(array)
  result = array.inject(:*).to_f / array.size
  format("The result is %0.3f", result)
end

p show_multiplicative_average([3, 5])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])
