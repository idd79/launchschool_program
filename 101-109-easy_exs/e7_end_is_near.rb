# The end is near but not here

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def middle_word(string)
  array = string.split
  middle = array.length / 2
  array.length.even? ? array[(middle - 1)..middle].join(' ') : array[middle]
end

p middle_word('hello my world once again')
p middle_word('hello my world again')
