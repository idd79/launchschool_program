# Build a basic calculator
# that asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result


# My solution

def run
  loop do
    puts "\n"
    puts "Menu:"
    puts "(a) Add"
    puts "(b) Substract"
    puts "(c) Multiply"
    puts "(d) Divide"
    puts "(e) Exit"
    print "Type one of the options from the menu above (i.e. a, b, ..., or e): "
    ans = gets.chomp
    case ans
    when "e"
      break
    when "a"
      puts "The result is #{operate("add")}"
    when "b"
      puts "The result is #{operate("substract")}"
    when "c"
      puts "The result is #{operate("multiply")}"
    when "d"
      operate("divide")
    end
  end
end

def operate(method)
  print "Enter the first number: "
  x = gets.chomp.to_f
  print "Enter the second number: "
  y = gets.chomp.to_f
  case method
  when "add"
    result = x + y
  when "substract"
    result = x - y
  when "multiply"
    result = x * y
  when "divide"
    if y == 0
      puts "Warning!, divided by 0"
    else
      puts "The result is #{x / y}"
    end
  end
end

# run()


# Lauchschool solution

puts("Welcome to Calculator")

puts("What's the first number?")
number1 = gets.chomp

puts("What's the second number?")
number2 = gets.chomp

puts "What operation would you like to perform? 1) add 2) substract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
else
  result = number1.to_f / number2.to_f
end

puts "The result is #{result}"
