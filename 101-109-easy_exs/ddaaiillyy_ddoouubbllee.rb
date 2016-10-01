def crunch(string)
  array = []
  string.each_char { |x| array.push(x) unless array.last == x }
  array.join
end

def crunch_regex(string)
  string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

p crunch_regex('ddaaiillyy ddoouubbllee')
p crunch_regex('4444abcabccba')
p crunch_regex('ggggggggggggggg')
p crunch_regex('a')
p crunch_regex('')
