# Transform a ten digit number removing special characters. Also checks if the
# number is greater or less than ten digits.

def phone_number(string)
  number = string.chars.map { |e| e if e =~ /\d/ }.compact
  return number.join if number.size == 10

  if number.size == 11 && number.first == '1'
    number[1..-1].join
  else
    '0000000000'
  end
end

p phone_number('(123) 456-7890')
p phone_number('(123) 456-78')
p phone_number('1234567890')
p phone_number('123-456-7890')
p phone_number('423.456.7890')
p phone_number('1423.456.7890')
p phone_number('423.456.78900')
