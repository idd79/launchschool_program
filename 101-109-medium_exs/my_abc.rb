BLOCKS = [['B', 'O'],  ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
          ['G', 'T'],  ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'],  ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  word = word.downcase
  result = true
  BLOCKS.each do |block|
    result = false if word.include?(block[0].downcase) & word.include?(block[1].downcase)
  end
  result
end

# Launchschool solution

BLOCKS2 = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word2?(string)
  up_string = string.upcase
  BLOCKS2.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
