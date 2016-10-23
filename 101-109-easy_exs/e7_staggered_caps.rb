# Staggered Caps

require 'pry'

def staggered_case(string)
  string.chars.map.with_index { |x, i| i.even? ? x.upcase : x.downcase }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case2(string, first = 'up')
  case first
  when 'up'
    string.chars.map.with_index { |x, i| i.even? ? x.upcase : x.downcase }.join
  when 'down'
    string.chars.map.with_index { |x, i| i.odd? ? x.upcase : x.downcase }.join
  end
end

# p staggered_case2('I Love Launch School!')
# p staggered_case2('I Love Launch School!', 'down')

# Staggered caps (part 2)

def staggered_case2(string, condition = 'alpha')
  indicator = 1
  array = string.downcase.chars.each_with_object([]) do |char, a|
    if condition == 'alpha'
      if char =~ /[a-zA-Z]/
        indicator == 1 ? a << char.upcase : a << char
        indicator *= -1
      else
        a << char
      end
    elsif condition == 'non-alpha'
      indicator == 1 ? a << char.upcase : a << char
      indicator *= -1
    end
  end
  array.join
end

p staggered_case2('I Love Launch School!')
p staggered_case2('ALL CAPS')
p staggered_case2('ignore 77 the 444 numbers')

p staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS') == 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'