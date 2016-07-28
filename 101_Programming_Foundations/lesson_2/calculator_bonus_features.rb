# Build a basic calculator
# that asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

# Lauchschool solution

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message)
  MESSAGES[LANGUAGE][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# def valid_number?(num)
#   num.to_i != 0
# end

# Better number validation
def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input =~ /^\d+$/
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def oper_to_message(op)
  message = case op
            when '1'
              'Adding'
            when '2'
              'Substracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end

  # Write additional commands above this message
  message
end

prompt(MESSAGES['welcome'])

prompt(MESSAGES['sel_language'])

language = ''

loop do
  language = gets.chomp

  case language
  when 'en'
    LANGUAGE = 'en'
    break
  when 'es'
    LANGUAGE = 'es'
    break
  else
    prompt("Please enter either 'en' or 'es'")
    prompt("Por favor seleccione 'en' or 'es'")
  end
end

prompt(messages('name'))

name = ''

loop do
  name = gets.chomp

  if name.empty?()
    prompt(messages('valid_name'))
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first_number'))
    number1 = gets.chomp
    if number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_number'))
    number2 = gets.chomp
    if number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) substract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{oper_to_message(operator)} the two numbers...")

  # Change to float as we are allowing floats as inputs
  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
