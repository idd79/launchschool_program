loop do
  answer = ''
  loop do
    puts '>> How many output lines do you want? Enter a number >= 3: ' \
         '(Q to quit)'
    answer = gets.chomp

    break if answer.casecmp('q') == 0 || answer.to_i >= 3
    puts ">> That's not enough lines."
  end

  break if answer.casecmp('q') == 0
  sentence = 'Launch School is the best!'
  answer.to_i.times { puts sentence }
end
