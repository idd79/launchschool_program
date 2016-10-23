# Capitalize Words

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
p word_cap('this is a "quoted" word')
p word_cap('four score and seven')    == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Without using the capitalize method

def word_cap2(string)
  string.downcase.gsub(/^[a-z]|\s[a-z]/, &:upcase)
end

p word_cap2('four score and seven')
p word_cap2('the javaScript language')
p word_cap2('this is a "quoted" word')
p word_cap2('four score and seven')    == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'

# Another solution from Launchschool

def word_cap3(string)
  string.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end
