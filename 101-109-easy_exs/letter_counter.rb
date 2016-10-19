# Letter counter (Part 1)

def word_sizes(string)
  hash = {}
  string.split.each do |word|
    hash[word.size] = hash.fetch(word.size, 0) + 1
  end
  hash
end

p word_sizes('Four score and seven.')                      == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?")                             == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('')                                           == {}

# Letter counter (Part 2)

def word_sizes_letters(string)
  hash = Hash.new(0)
  string.split.each do |word|
    size = word.count "a-zA-Z"
    # or
    # size = word.chars.count { |x| x.match(/\w/) }
    hash[size] += 1
  end
  hash
end

p word_sizes_letters('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes_letters('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes_letters("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes_letters('') == {}
