# Clean up the words

def cleanup(string)
  string = string.gsub(/\W/, ' ')
  # or
  # string = string.gsub(/[^a-zA-Z]/, ' ')
  # or
  # string = string.gsub(/[^a-zA-Z]+/, ' ') # the + means one or more times.
  # Wtih this one no need for the following line
  string.gsub(/\s+/, ' ')
end

# Without regex

VALID_CHARS = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

def cleanup2(string)
  new_string = []
  string.each_char do |x|
    VALID_CHARS.include?(x) ? new_string << x : new_string << ' '
  end
  count = 0
  new_string2 = []
  new_string.each do |x|
    count += 1 if x == ' '
    count *= 0 if VALID_CHARS.include?(x)
    new_string2 << x if count <= 1
  end
  new_string2.join
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup2("---what's my +*& line?") == ' what s my line '
