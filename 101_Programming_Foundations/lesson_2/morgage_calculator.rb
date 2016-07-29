# margage_calculator.rb

def prompt_puts(message, style = '-->')
  puts "\n"
  puts "#{style} #{message}"
end

def prompt_print(message, style = '-->')
  puts "\n"
  print "#{style} #{message}"
end

def number?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def integer?(input)
  input =~ /^\d+$/
end

def monthly_payment(loan, apr, n)
  loan * ((apr / 1200) / (1 - (1 + (apr / 1200))**-n))
end

# Taken from http://stackoverflow.com/questions/1078347/is-there-a-rails-trick-
# to-adding-commas-to-large-numbers
def number_thousand_format(number)
  parts = number.to_s.split('.')
  parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
  parts.join('.')
end

prompt_puts('Welcome to the Morgage Calculator!')

loop do
  loan_amount = ''
  apr = ''
  loan_duration = ''
  loop do
    loop do
      prompt_print('Enter the loan amount: ')
      ans = gets.chomp

      if number?(ans)
        loan_amount = ans.to_f
        break
      else
        prompt_puts('Please enter a valid number...')
      end
    end

    loop do
      prompt_print('Enter the APR (e.g., if 5.3%, enter 5.3): ')
      ans = gets.chomp

      if number?(ans)
        apr = ans.to_f
        break
      else
        prompt_puts('Please enter a valid number...')
      end
    end

    loop do
      prompt_print('Enter the loan duration (in number of months): ')
      ans = gets.chomp

      if integer?(ans)
        loan_duration = ans.to_i
        break
      else
        prompt_puts('Please enter a valid number...')
      end
    end

    prompt_puts('The information you entered is the following:')
    prompt_puts("Loan amount: $ #{number_thousand_format(loan_amount)}",
                '--> --')
    prompt_puts("APR: #{apr}%", '--> --')
    prompt_puts("Loan duration: #{loan_duration} months", '--> --')

    prompt_print('Is this information correct? (yes, or no): ')
    answer = gets.chomp
    break if answer.downcase.start_with?('y')
  end

  monthly_payment = monthly_payment(loan_amount, apr, loan_duration)
  monthly_payment = number_thousand_format(format('%0.2f', monthly_payment))

  prompt_puts("Your monthly payment would be: $ #{monthly_payment}", '--> --')

  prompt_print('Do you want to perform another calculation? (yes, or no): ')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt_puts("Thank you for using the morgage calculator. Good bye!")
