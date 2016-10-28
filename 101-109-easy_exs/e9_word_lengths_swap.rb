# How long are you?

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}" }
end

p word_lengths('cow sheep chicken')
p word_lengths('cow sheep chicken') == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths('baseball hot dogs and apple pie') ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == 
  ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths('Supercalifragilisticexpialidocious') ==
  ['Supercalifragilisticexpialidocious 34']
p word_lengths('') == []

# Name swapping

def swap_name(name)
  # array = name.split
  # "#{array[1]}, #{array[0]}"
  name.split(' ').reverse.join(', ')
end

# Or using Regex

def swap_name2(name)
  name.sub(/(\w+)\s(\w+)/, '\2, \1')
end

p swap_name('Joe Roberts')
p swap_name2('Joe Roberts')
p swap_name('Joe Roberts') == 'Roberts, Joe'
