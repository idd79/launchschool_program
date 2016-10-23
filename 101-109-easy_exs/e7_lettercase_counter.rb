# Lettercase Counter

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char do |char|
    if char =~ /[a-z]/
      result[:lowercase] += 1
    elsif char =~ /[A-Z]/
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end
  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef')   == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123')        == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('')           == { lowercase: 0, uppercase: 0, neither: 0 }
