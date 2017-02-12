# OO Tic Tac Toe game

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

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  private

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
    sleep(2)
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe. Goodbye!'
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

  def human_moves
    if board.unmarked_keys.size == 1
      puts "Choose the last square available (#{board.unmarked_keys[0]})"
    else
      puts "Choose a square (#{board.unmarked_keys[0...-1].join(', ')}" \
           " or #{board.unmarked_keys[-1]}):"
    end

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
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker then puts 'You won!'
    when computer.marker then puts 'Computer won!'
    else puts "It's a tie!"
    end
  end

  def play_again?
    ans = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      ans = gets.chomp.downcase
      break if %w(y n yes no).include? ans
      puts 'Sorry, must be y or n'
    end

    %w(y yes).include?(ans)
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear_screen
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  public
  
  def play
    display_welcome_message

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play
