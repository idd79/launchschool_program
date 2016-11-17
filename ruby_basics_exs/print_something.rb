answer = ''
loop do
  puts '>> Do you want to print something? (y/n)'
  answer = gets.chomp.downcase

  break if %w(y n).include?(answer)
  puts '>> Invalid input! Please enter y or n'
end

puts 'something' if answer == 'y'
