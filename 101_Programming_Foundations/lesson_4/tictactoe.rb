# tictactoe.rb

WINNING_CASES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

def display_board(brd)
  puts ""
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts "---+---+---"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts "---+---+---"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts ""
end

def almost_win_case(brd, mark)
  selection = []
  values = []
  WINNING_CASES.each do |item|
    if brd.values_at(*item).count(mark) == 2 &&
       brd.values_at(*item).count(" ") == 1
      selection = item
      values = brd.values_at(*item)
      break
    else
      next
    end
  end
  [selection, values]
end

def computer_chooce(current_board, mark)
  selection, values = almost_win_case(current_board, mark)
  selection.empty? ? nil : selection[values.index(" ")].to_s
end

def win_condition?(brd, mark)
  WINNING_CASES.any? do |item|
    brd.values_at(*item).count(mark) == 3
  end
end

def annotate_board!(hash, input, mark)
  hash[input.to_i] = mark
  hash
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def initial_choices_board
  new_board = {}
  (1..9).each { |num| new_board[num] = num.to_s }
  new_board
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system("clear") || system("cls")
end

def ask_player(question)
  prompt question
  gets.chomp
end

def ask_player_loop(question, *options)
  answer = ''
  loop do
    answer = ask_player(question)

    break if answer.downcase.start_with?(*options)
    clear_screen
    prompt "That's not a valid choice. Try again."
  end
  answer
end

def valid_mark?(answer)
  answer.casecmp("x") == 0 || answer.casecmp("o") == 0
end

def valid_choice?(status_array, choice)
  choice.match(/^\d{1}$/) && status_array.include?(choice)
end

def valid_winning_score?(input)
  input =~ /^\d+$/ && (1..5).cover?(input.to_i)
end

def add_score!(player, current_score)
  current_score[player.to_sym] += 1
end

def alternate_player(player)
  player == 'human' ? 'computer' : 'human'
end

def prompt_player_won(brd, player)
  display_board(brd)
  prompt "#{player} won!"
end

def prompt_its_a_tie(brd)
  clear_screen
  display_board(brd)
  prompt("Oh! It's a tie.")
end

def prompt_players_chose(player, choice)
  prompt "#{player} chose #{choice}"
  puts ""
end

def computers_strategy(current_brd, status_brd,
                       players_marker, computers_marker, level)
  if !computer_chooce(current_brd, computers_marker).nil? # Winning strategy
    computer_chooce(current_brd, computers_marker)
  elsif !computer_chooce(current_brd, players_marker).nil? # Defensive strategy
    computer_chooce(current_brd, players_marker)
  elsif level == 'medium' && current_brd[5] == " " # Select 5 strategy
    "5"
  else
    status_brd.values.select { |i| i != " " }.sample # Random strategy
  end
end

def human_plays(current_brd, status_brd, mark)
  prompt "Your turn..."
  puts ""
  choice = ""
  loop do
    prompt("Current game board: (Your marker is #{mark})")
    display_board(current_brd)
    prompt("Choose a number from the board below:")
    display_board(status_brd)
    choice = gets.chomp

    break if valid_choice?(status_brd.values, choice)
    clear_screen
    prompt("You entered a wrong value! Please try again...")
  end
  annotate_board!(current_brd, choice, mark)
  annotate_board!(status_brd, choice, " ")
end

def computer_plays(brd, status_brd, players_marker, computers_marker, level)
  computers_choice =
    computers_strategy(brd, status_brd,
                       players_marker, computers_marker, level)

  annotate_board!(brd, computers_choice, computers_marker)
  annotate_board!(status_brd, computers_choice, " ")

  prompt_players_chose('Computer', computers_choice)
end

clear_screen
puts "Welcome to Tic Tac Toe game"

score = { human: 0, computer: 0 }

winning_score = ''
loop do
  winning_score = ask_player("What should be the winning score? " \
                             "(choose a number from 1 to 5):")

  break if valid_winning_score?(winning_score)
  clear_screen
  prompt("That's not a valid choice.")
end

initial_player = ''
initial_player = ask_player_loop("Who should play first? (human or computer)",
                                 'hum', 'com')

initial_player =
  initial_player.downcase.start_with?('hum') ? 'human' : 'computer'

level = ''
level = ask_player_loop("Select the level of difficulty: (easy or medium)",
                        'eas', 'med')

level =
  level.downcase.start_with?('eas') ? 'easy' : 'medium'

players_mark = ''
loop do
  players_mark = ask_player("Select your marker: 'X' or 'O'")

  break if valid_mark?(players_mark)
  clear_screen
  prompt "That's not a valid choice"
end

players_mark = players_mark.upcase

computers_mark =
  players_mark == "X" ? "O" : "X"

# Main loop
loop do
  clear_screen
  board = initialize_board
  status_board = initial_choices_board

  prompt "The current score is " \
         "Player: #{score[:human]}/#{winning_score}; " \
         "Computer: #{score[:computer]}/#{winning_score}."
  puts ""

  current_player = initial_player
  # Inside game loop
  loop do
    if current_player == 'human'
      human_plays(board, status_board, players_mark)
      clear_screen
    else
      computer_plays(board, status_board, players_mark, computers_mark, level)
    end

    current_player = alternate_player(current_player)

    if win_condition?(board, players_mark)
      prompt_player_won(board, 'You')
      add_score!('human', score)
      break
    elsif win_condition?(board, computers_mark)
      prompt_player_won(board, 'Computer')
      add_score!('computer', score)
      break
    elsif !board.values.include?(" ")
      prompt_its_a_tie(board)
      break
    end
  end

  # Play again? loop and conditional
  if score[:human] < winning_score.to_i && score[:computer] < winning_score.to_i
    answer = ''
    loop do
      answer = ask_player("Do you want to play the next round? (y/n)")

      break if answer.downcase.start_with?('y', 'n')
      prompt("Please choose either y or n")
    end

    break unless answer.downcase.start_with?('y')
  else
    break
  end
end

if score.key(winning_score.to_i) == :human
  prompt "The score is " \
         "Player: #{score[:human]}; Computer: #{score[:computer]}"
  puts ""
  prompt("Congratulations, You have won the match! ;)")
elsif score.key(winning_score.to_i) == :computer
  prompt "The score is " \
         "Player: #{score[:human]}; Computer: #{score[:computer]}"
  puts ""
  prompt("Sorry, You have lost the match!")
end

puts ""
prompt "Thanks for playing Tic Tac Toe! Good bye."
puts ""
