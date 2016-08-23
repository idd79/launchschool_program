# tictactoe.rb

def display_board(brd)
  puts ""
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts "---+---+---"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts "---+---+---"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts ""
end

def winning_cases
  [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
   [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
end

def almost_win_case(brd, mark = 'X')
  selection = []
  values = []
  winning_cases.each do |item|
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

def computer_chooce(current_board, mark = 'X')
  selection, values = almost_win_case(current_board, mark)
  selection.empty? ? nil : selection[values.index(" ")].to_s
end

def win_condition?(brd, mark = 'X')
  winning_cases.any? do |item|
    brd.values_at(*item).count(mark) == 3
  end
end

def annotate_board!(hash, input, mark = "X")
  hash[input.to_i] = mark
  hash
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def initial_choices
  new_board = {}
  (1..9).each { |num| new_board[num] = num.to_s }
  new_board
end

def prompt(message)
  puts "=> #{message}"
end

def ask_player(question)
  prompt question
  gets.chomp
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

def alternate_player(ply)
  ply == 'human' ? 'computer' : 'human'
end

def ask_player_loop(variable, question, *options)
  loop do
    variable = ask_player(question)

    break if variable.downcase.start_with?(*options)
    system 'clear'
    prompt "That's not a valid choice. Try again."
  end
  variable
end

system 'clear'
puts "Welcome to Tic Tac Toe game"

score = { human: 0, computer: 0 }

winning_score = ''
loop do
  winning_score = ask_player("What should be the winning score? " \
                             "(choose a number from 1 to 5):")

  break if valid_winning_score?(winning_score)
  system 'clear'
  prompt("That's not a valid choice.")
end

initial_player = ''
initial_player = ask_player_loop(initial_player,
                                 "Who should play first? (human or computer)",
                                 'hum', 'com')

initial_player =
  initial_player.downcase.start_with?('hum') ? 'human' : 'computer'

level = ''
level = ask_player_loop(level,
                        "Select the level of difficulty: (easy or medium)",
                        'eas', 'med')

level =
  level.downcase.start_with?('eas') ? 'easy' : 'medium'

players_mark = ''
# Select X or O loop
loop do
  players_mark = ask_player("Select your marker: 'X' or 'O'")

  break if valid_mark?(players_mark)
  system 'clear'
  prompt "That's not a valid choice"
end

players_mark = players_mark.upcase

computers_mark =
  players_mark == "X" ? "O" : "X"

# Main loop
loop do
  system 'clear'
  board = initialize_board
  status_board = initial_choices

  prompt "The current score is " \
         "Player: #{score[:human]}/#{winning_score}; " \
         "Computer: #{score[:computer]}/#{winning_score}."
  puts ""

  current_player = initial_player
  # Inside game loop
  loop do
    case current_player
    when 'human'

      choice = ""
      # Player game choice loop
      loop do
        prompt "Your turn..."
        puts ""
        prompt("Current game board: (Your marker is #{players_mark})")
        display_board(board)
        prompt("Choose a number from the board below:")
        display_board(status_board)
        choice = gets.chomp

        break if valid_choice?(status_board.values, choice)
        prompt("You entered a wrong value! Please try again...")
      end

      annotate_board!(board, choice, players_mark)
      annotate_board!(status_board, choice, " ")

      system 'clear'
      prompt "You have chosen #{choice}"
      puts ""

      if win_condition?(board, players_mark)
        system 'clear'
        prompt("You have chosen #{choice}")
        display_board(board)
        prompt("You won!")
        add_score!('human', score)
        break
      elsif !board.values.include?(" ")
        system 'clear'
        prompt("You have chosen #{choice}")
        display_board(board)
        prompt("Oh! It's a tie.")
        break
      end

      current_player = alternate_player(current_player)

    when 'computer'

      computers_choice =
        if !computer_chooce(board, computers_mark).nil? # Winning strategy
          computer_chooce(board, computers_mark)
        elsif !computer_chooce(board, players_mark).nil? # Defensive strategy
          computer_chooce(board, players_mark)
        elsif level == 'medium' && board[5] == " "
          "5"
        else
          status_board.values.select { |i| i != " " }.sample # Random strategy
        end

      annotate_board!(board, computers_choice, computers_mark)
      annotate_board!(status_board, computers_choice, " ")

      prompt "Computer has chosen #{computers_choice}"
      puts ""

      if win_condition?(board, computers_mark)
        display_board(board)
        prompt("The computer won!")
        add_score!('computer', score)
        break
      elsif !board.values.include?(" ")
        system 'clear'
        prompt("Computer has chosen #{computers_choice}")
        display_board(board)
        prompt("Oh! It's a tie.")
        break
      end

      current_player = alternate_player(current_player)
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

if score[:human] < winning_score.to_i && score[:computer] < winning_score.to_i
  prompt("You have withdrawn, so the computer wins :D ")
elsif score.key(winning_score.to_i) == :human
  prompt "The score is " \
         "Player: #{score[:human]}; Computer: #{score[:computer]}"
  puts ""
  prompt("Congratulations, You have won the match! ;)")
else
  prompt "The score is " \
         "Player: #{score[:human]}; Computer: #{score[:computer]}"
  puts ""
  prompt("Sorry, You have lost the match!")
end

puts ""
prompt "Thanks for playing Tic Tac Toe! Good bye."
puts ""
