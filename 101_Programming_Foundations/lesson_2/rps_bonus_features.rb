# rps_bonus_features.rb
# Implement the RPS games adding the Lizard and Spock options

WIN_CONDITIONS = { "rock" => %w(scissors lizard),
                   "paper" => %w(rock spock),
                   "scissors" => %w(paper lizard),
                   "lizard" => %w(paper spock),
                   "spock" => %w(scissors rock) }

CHOICES = { "rock" => "r",
            "paper" => "p",
            "scissors" => "s",
            "lizard" => "l",
            "spock" => "v" }

def win?(piece, other)
  WIN_CONDITIONS[piece].include?(other)
end

def game_ending_message(answer_player, answer_computer)
  if win?(answer_player, answer_computer)
    "You won!"
  elsif win?(answer_computer, answer_player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def prompt(message)
  puts("=> #{message}")
end

def add_score_for_player!(player, score)
  score[player.to_sym] += 1
end

def add_score!(answer_player, answer_computer, score)
  if win?(answer_player, answer_computer)
    add_score_for_player!("player", score)
  elsif win?(answer_computer, answer_player)
    add_score_for_player!("computer", score)
  end
end

def valid_integer?(input)
  input =~ /^\d+$/ && input.to_i <= 5
  # or,
  # input =~ /^\d{1}$/ && input <= "5"
end

score = { player: 0, computer: 0 }

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
    prompt("Your choices are:")
    CHOICES.each { |k, v| puts "#{v} for #{k}" }

    print "Type one of the choices above: "
    choice = gets.chomp.downcase

    if CHOICES.values.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  choice = CHOICES.key(choice)
  computer_choice = CHOICES.keys.sample

  add_score!(choice, computer_choice, score)

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  prompt(game_ending_message(choice, computer_choice))

  prompt("The score is:\n" \
         "Player = #{score[:player]}, Computer = #{score[:computer]}")

  winning_score = winning_score.to_i

  if score[:player] < winning_score && score[:computer] < winning_score
    prompt("Do you want to play again? (y/n)")
    answer = ''
    loop do
      answer = gets.chomp
      if answer.downcase.start_with?('y', 'n')
        break
      else
        prompt("Please choose either y or n")
      end
    end
    break unless answer.downcase.start_with?('y')
  else
    break
  end
end

if score[:player] < winning_score && score[:computer] < winning_score
  prompt("You have withdrawn, so I (the computer) win :D ")
elsif score.key(winning_score) == :player
  prompt("Congratulations, You have won! ;)")
else
  prompt("Sorry, You lost, I (the computer) won :D")
end

prompt("Thank you for playing. Good bye!")
