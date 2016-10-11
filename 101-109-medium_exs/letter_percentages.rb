# Lettercase Percentage Ratio

# def letter_case(string)
#   hash = {}
#   string.each_char do |x|
#     if x =~ /[^A-Za-z]/
#       hash['neither'] = hash.fetch('neither', 0) + 1
#     elsif x =~ /[a-z]/
#       hash['lowercase'] = hash.fetch('lowercase', 0) + 1
#     elsif x =~ /[A-Z]/
#       hash['uppercase'] = hash.fetch('uppercase', 0) + 1
#     end
#   end
#   hash
# end

def letter_case(string)
  hash = { 'lowercase' => 0, 'uppercase' => 0, 'neither' => 0 }
  string.each_char do |x|
    if x =~ /[^A-Za-z]/
      hash['neither'] += 1
    elsif x =~ /[a-z]/
      hash['lowercase'] += 1
    elsif x =~ /[A-Z]/
      hash['uppercase'] += 1
    end
  end
  hash
end

def letter_percentages(string)
  hash = letter_case(string)
  sum = hash.values.reduce(0, :+)
  hash.each do |k, v|
    hash[k] = (v / sum.to_f * 100).round(1)
  end
  hash
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')
