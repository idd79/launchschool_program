# Build a basic calculator
# that asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

# My solution

# def run
#   loop do
#     puts "\n"
#     puts "Menu:"
#     puts "(a) Add"
#     puts "(b) Substract"
#     puts "(c) Multiply"
#     puts "(d) Divide"
#     puts "(e) Exit"
#     print "Type one of the options from the menu above
#           (i.e. a, b, ..., or e): "
#     ans = gets.chomp
#     case ans
#     when "e"
#       break
#     when "a"
#       puts "The result is #{operate("add")}"
#     when "b"
#       puts "The result is #{operate("substract")}"
#     when "c"
#       puts "The result is #{operate("multiply")}"
#     when "d"
#       operate("divide")
#     end
#   end
# end

# def operate(method)
#   print "Enter the first number: "
#   x = gets.chomp.to_f
#   print "Enter the second number: "
#   y = gets.chomp.to_f
#   case method
#   when "add"
#     x + y
#   when "substract"
#     x - y
#   when "multiply"
#     x * y
#   when "divide"
#     if y == 0
#       puts "Warning!, divided by 0"
#     else
#       puts "The result is #{x / y}"
#     end
#   end
# end

# run()

# Lauchschool solution

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Substracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''

loop do
  name = gets.chomp

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp
    if valid_number?(number2)
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

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
