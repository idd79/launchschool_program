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

def winning_cases(brd)
  { [1, 2, 3] => brd.values_at(1, 2, 3),
    [4, 5, 6] => brd.values_at(4, 5, 6),
    [7, 8, 9] => brd.values_at(7, 8, 9),
    [1, 4, 7] => brd.values_at(1, 4, 7),
    [2, 5, 8] => brd.values_at(2, 5, 8),
    [3, 6, 9] => brd.values_at(3, 6, 9),
    [1, 5, 9] => brd.values_at(1, 5, 9),
    [3, 5, 7] => brd.values_at(3, 5, 7) }
end

def almost_win_cases(brd, mark = 'X')
  almost_win1 = [mark, " ", mark]
  almost_win2 = [mark, mark, " "]
  almost_win3 = [" ", mark, mark]
  selection = []
  values = []
  winning_cases(brd).each do |key, value|
    if value == almost_win1 || value == almost_win2 || value == almost_win3
      selection = key
      values = value
      break
    else
      next
    end
  end
  [selection, values]
end

def computer_chooce(current_board, mark = 'X')
  selection, values = almost_win_cases(current_board, mark)
  selection.empty? ? nil : selection[values.index(" ")].to_s
end

def win_condition?(array, mark = 'X')
  winning_array = [mark, mark, mark]
  condition = false
  array.each { |item| condition = true if item == winning_array }
  condition
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

def valid_mark?(answer)
  answer.casecmp("x") == 0 || answer.casecmp("o") == 0
end

def valid_choice?(status_array, choice)
  choice.match(/^\d{1}$/) && status_array.include?(choice)
end

puts "Welcome to Tic Tac Toe game"
# Main loop
loop do
  system 'clear'
  board = initialize_board
  status_board = initial_choices

  players_mark = ""
  # Select X or O loop
  loop do
    prompt("Select the letter you want to play with: 'X' or 'O'")
    players_mark = gets.chomp
    break if valid_mark?(players_mark)
  end

  players_mark = players_mark.upcase

  computers_mark =
    players_mark == "X" ? "O" : "X"

  # Inside game loop
  loop do
    choice = ""
    # Player game choice loop
    loop do
      prompt("Current game board: (You are #{players_mark})")
      display_board(board)
      prompt("Choose a number from the board below:")
      display_board(status_board)
      choice = gets.chomp
      if valid_choice?(status_board.values, choice)
        break
      else
        prompt("You entered a wrong value! Please try again...")
      end
    end

    annotate_board!(board, choice, players_mark)
    annotate_board!(status_board, choice, " ")

    if win_condition?(winning_cases(board).values, players_mark)
      system 'clear'
      prompt("You have chosen #{choice}")
      display_board(board)
      prompt("Congratulations! You won!")
      break
    elsif !board.values.include?(" ")
      system 'clear'
      prompt("You have chosen #{choice}")
      display_board(board)
      prompt("Oh! It's a tie.")
      break
    end

    computers_choice =
      if !computer_chooce(board, computers_mark).nil? # Winning strategy
        computer_chooce(board, computers_mark)
      elsif !computer_chooce(board, players_mark).nil? # Defensive strategy
        computer_chooce(board, players_mark)
      else
        status_board.values.select { |i| i != " " }.sample # Random strategy
      end

    annotate_board!(board, computers_choice, computers_mark)
    annotate_board!(status_board, computers_choice, " ")

    system 'clear'
    prompt("You have chosen #{choice}")
    prompt("Computer has chosen #{computers_choice}")
    puts ""

    next unless win_condition?(winning_cases(board).values, computers_mark)
    display_board(board)
    prompt("Too bad, the computer won!")
    break
  end

  prompt("Do you want to play again? (y/n)")
  answer = ""

  # Play again? loop
  loop do
    answer = gets.chomp
    if answer.downcase.start_with?('y', 'n')
      break
    else
      prompt("Please choose either y or n")
    end
  end

  break unless answer.downcase.start_with?('y')
end
