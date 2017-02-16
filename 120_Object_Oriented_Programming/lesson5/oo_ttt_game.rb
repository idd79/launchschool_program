# OO Tic Tac Toe game

# require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    # @squares = { 1 => Square.new('X'), 2 => Square.new(' ')... }
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |num| @squares[num] = Square.new }
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    # @squares.select { |_, sq| sq.marker == INITIAL_MARKER }.keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def draw
    puts " #{@squares[1]} | #{@squares[2]} | #{@squares[3]} "
    puts '---|---|---'
    puts " #{@squares[4]} | #{@squares[5]} | #{@squares[6]} "
    puts '---|---|---'
    puts " #{@squares[7]} | #{@squares[8]} | #{@squares[9]} "
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      markers = @squares.values_at(*line).map(&:marker)

      if markers.uniq.size == 1 && markers.uniq != [Square::INITIAL_MARKER]
        return markers.uniq[0]
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '.freeze

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  FIRST_TO_MOVE = HUMAN_MARKER
  WINNING_POINTS = 3

  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @score = { human.marker => 0, computer.marker => 0 }
    @current_marker = FIRST_TO_MOVE
  end

  private

  def add_point(player)
    @score[player.marker] += 1
  end

  def display_score
    puts ''
    puts '--> The score is:'
    @score.each do |k, v|
      case k
      when human.marker then puts "Human = #{v}"
      else puts "Computer = #{v}"
      end
    end
    puts ''
  end

  def return_points_all
    score.values
  end

  def return_points_player(player_name)
    score[player_name]
  end

  def change_total_score
    case board.winning_marker
    when human.marker then add_point(human)
    when computer.marker then add_point(computer)
    end
  end

  def reset_score_and_board
    @score = { human.marker => 0, computer.marker => 0 }
    reset_board
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def clear_screen_and_display_board
    system('clear') || system('cls')
    display_board
  end

  def display_board
    puts "You are an #{human.marker}. The computer is an #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def joinor(array, sep = ', ', word = 'or')
    case array.size
    when 1
      array.first
    when 2
      array.join(sep)
    else
      array[-1] = "#{word} #{array.last}"
      array.join(sep)
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)})"

    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end

    board[square] = human.marker
  end

  def computer_moves
    square = board.unmarked_keys.sample
    board[square] = computer.marker
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen
    board.draw

    puts ''
    case board.winning_marker
    when human.marker then puts 'You won!'
    when computer.marker then puts 'Computer won!'
    else puts "It's a tie!"
    end
  end

  def display_match_winner
    winner_marker = score.select { |_, v| v == WINNING_POINTS }.keys

    clear_screen
    display_score
    
    case winner_marker.first
    when human.marker then puts "Congratulations, you have won the match!"
    else 'Computer has won the match!'
    end
  end

  def play_again?
    ans = nil
    loop do
      puts ''
      puts 'Would you like to play again? (y/n)'
      ans = gets.chomp.downcase
      break if %w(y n yes no).include? ans
      puts 'Sorry, must be y or n'
    end

    %w(y yes).include?(ans)
  end

  def reset_board
    board.reset
    @current_marker = FIRST_TO_MOVE
  end

  def display_play_again_message
    clear_screen
    puts "Let's play again!"
  end

  def display_next_round_message
    puts ''
    puts 'Next round...'
  end

  public

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    sleep(2)
  end

  def display_goodbye_message
    puts ''
    puts 'Thanks for playing Tic Tac Toe. Goodbye!'
  end

  def play
    loop do
      loop do
        display_score
        display_board

        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end

        change_total_score
        break if return_points_all.include?(WINNING_POINTS)
        display_result
        reset_board
        display_next_round_message
      end

      display_match_winner
      break unless play_again?
      reset_score_and_board
      display_play_again_message
    end
  end
end

game = TTTGame.new
game.display_welcome_message
game.play
game.display_goodbye_message
