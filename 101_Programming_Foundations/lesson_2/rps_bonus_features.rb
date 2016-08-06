# rps_bonus_features.rb
# Implement the RPS games adding the Lizard and Spock options

PRINTED_CHOICES = %w((r)ock (p)aper (s)cissors (l)izard (S)pock)
VALID_CHOICES = %w(r p s l S)

def rock_wins?(p_ans_rock, p_ans_other)
  (p_ans_rock == 'r' && (p_ans_other == 's' || p_ans_other == 'l'))
end

def paper_wins?(p_ans_paper, p_ans_other)
  (p_ans_paper == 'p' && (p_ans_other == 'r' || p_ans_other == 'S'))
end

def scissors_win?(p_ans_scissors, p_ans_other)
  (p_ans_scissors == 's' && (p_ans_other == 'p' || p_ans_other == 'l'))
end

def lizard_wins?(p_ans_lizard, p_ans_other)
  (p_ans_lizard == 'l' && (p_ans_other == 'p' || p_ans_other == 'S'))
end

def spock_wins?(p_ans_spock, p_ans_other)
  (p_ans_spock == 'S' && (p_ans_other == 's' || p_ans_other == 'r'))
end

def player1_win?(ans_player1, ans_player2)
  rock_wins?(ans_player1, ans_player2) ||
    paper_wins?(ans_player1, ans_player2) ||
    scissors_win?(ans_player1, ans_player2) ||
    lizard_wins?(ans_player1, ans_player2) ||
    spock_wins?(ans_player1, ans_player2)
end

def display_results(answer_player, answer_computer)
  if player1_win?(answer_player, answer_computer)
    "You won!"
  elsif player1_win?(answer_computer, answer_player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def prompt(message)
  puts("=> #{message}")
end

def add_result_player!(player, results)
  results[player.to_sym] += 1
end

def add_results!(answer_player, answer_computer, results)
  if player1_win?(answer_player, answer_computer)
    add_result_player!("player", results)
  elsif player1_win?(answer_computer, answer_player)
    add_result_player!("computer", results)
  end
end

def valid_integer?(input)
  input =~ /^\d+$/ && input <= "5"
end

results = { player: 0, computer: 0 }

prompt("Welcome to ROCK PAPER SCISSORS SPOCK LIZARD game!")

winning_score = ''

loop do
  prompt("Please enter the winning score (a number from 1 to 5):")
  winning_score = gets.chomp

  if valid_integer?(winning_score)
    break
  else
    prompt("That's not a valid choice.")
  end
end

loop do
  choice = ''

  loop do
    prompt("Choose the initial letter of one of the following words:
    #{PRINTED_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  add_results!(choice, computer_choice, results)

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  prompt(display_results(choice, computer_choice))

  prompt("The score is:
Player = #{results[:player]}, Computer = #{results[:computer]}")

  winning_score = winning_score.to_i

  if results[:player] < winning_score && results[:computer] < winning_score
    prompt("Do you want to play again?")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  else
    break
  end
end

if results[:player] < winning_score && results[:computer] < winning_score
  prompt("You have withdrawn, so I (the computer) win :D ")
elsif results.key(winning_score) == :player
  prompt("Congratulations, You have won! ;)")
else
  prompt("Sorry, You lost, I (the computer) won :D")
end

prompt("Thank you for playing. Good bye!")
