# OO Tic Tac Toe game

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
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
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winner_marker
  end

  def draw
    puts " #{@squares[1]} | #{@squares[2]} | #{@squares[3]} "
    puts '---|---|---'
    puts " #{@squares[4]} | #{@squares[5]} | #{@squares[6]} "
    puts '---|---|---'
    puts " #{@squares[7]} | #{@squares[8]} | #{@squares[9]} "
  end

  # returns winner marker or nil
  def winner_marker
    WINNING_LINES.each do |line|
      markers = @squares.values_at(*line).map(&:marker)

      if markers.uniq.size == 1 && markers.uniq != [Square::INITIAL_MARKER]
        return markers.uniq[0]
      end
    end

    nil
  end

  # returns a hash of almost winning markers and square numbers
  def almost_winning_markers
    winning_ops = {}
    WINNING_LINES.each do |line|
      squares = @squares.select { |k, _| line.include? k }
      markers = squares.values.map(&:marker)

      next unless markers.uniq.size == 2 &&
                  markers.count(Square::INITIAL_MARKER) == 1

      marker = markers.uniq.select { |m| m != Square::INITIAL_MARKER }.first
      square = squares.select { |_, v| v.marker == Square::INITIAL_MARKER }
      sq_number = square.keys.first
      winning_ops[sq_number] = marker
    end

    winning_ops
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
  attr_accessor :marker, :name
end

class Human < Player
  attr_reader :first_to_move

  def initialize
    set_name
    set_marker
    set_first_to_move
  end

  def set_name
    ans = ''
    loop do
      puts "What's your name?"
      ans = gets.chomp.strip
      break unless ans.empty?
      puts "Sorry, must enter a value."
    end

    self.name = ans
  end

  def set_marker
    ans = nil
    loop do
      puts 'Choose a marker (X or O):'
      ans = gets.chomp
      break if ['X', 'O'].include?(ans)
      puts 'Sorry, you must enter a valid marker!'
    end

    self.marker = ans
  end

  def set_first_to_move
    ans = nil
    loop do
      puts 'Do you want to move first? (y/n)'
      ans = gets.chomp.downcase
      break if %w(y n yes no).include?(ans)
      puts "Sorry, that's not a valid answer, please try again!"
    end

    @first_to_move = %w(y yes).include?(ans) ? marker : nil
  end
end

class Computer < Player
  def initialize(human_marker)
    @human_marker = human_marker
    set_name
    set_marker
  end

  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number\ 5).sample
  end

  def set_marker
    self.marker = case @human_marker
                  when 'X' then 'O'
                  else 'X'
                  end
  end
end

class TTTGame
  WINNING_POINTS = 3

  attr_reader :board, :human, :computer, :score

  def initialize
    display_welcome_message
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(human.marker)
    @score = { human.name => 0, computer.name => 0 }
    @current_marker = human.first_to_move ? human.marker : computer.marker
  end

  private

  def add_point(player)
    @score[player.name] += 1
  end

  def display_score
    puts ''
    puts '--> The score is:'
    @score.each { |k, v| puts "#{k} = #{v}" }
    puts ''
  end

  def score_points
    score.values
  end

  def change_score_and_clear_screen
    case board.winner_marker
    when human.marker then add_point(human)
    when computer.marker then add_point(computer)
    end

    clear_screen
  end

  def reset_score_and_board
    @score = { human.name => 0, computer.name => 0 }
    reset_board
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_board
    puts "You are an #{human.marker}. " \
         "#{computer.name} is an #{computer.marker}."
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
      square = gets.chomp
      break if square.match(/^\d$/) && board.unmarked_keys.include?(square.to_i)
      puts "Sorry, that's not a valid choice"
    end

    board[square.to_i] = human.marker
  end

  def computer_winning_options
    computer_options = board.almost_winning_markers.select do |_, v|
      v == computer.marker
    end

    computer_options.keys
  end

  def human_winning_options
    human_options = board.almost_winning_markers.select do |_, v|
      v == human.marker
    end

    human_options.keys
  end

  def computer_moves
    square = if !computer_winning_options.empty?
               computer_winning_options.sample
             elsif !human_winning_options.empty?
               human_winning_options.sample
             elsif board.unmarked_keys.include?(5)
               5
             else
               board.unmarked_keys.sample
             end

    board[square] = computer.marker
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
      clear_screen
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    board.draw

    puts ''
    case board.winner_marker
    when human.marker then puts 'You won!'
    when computer.marker then puts "#{computer.name} won!"
    else puts "It's a tie!"
    end
  end

  def display_match_winner
    clear_screen
    board.draw
    display_score

    winner_marker = score.select { |_, v| v == WINNING_POINTS }.keys

    case winner_marker.first
    when human.name then puts "Congratulations, you have won the match!"
    else puts "#{computer.name} has won the match!"
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
    @current_marker = human.first_to_move ? human.marker : computer.marker
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
    clear_screen
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_start_playing_message
    clear_screen
    puts "Let's start playing, #{human.name}!"
    sleep(2)
  end

  def display_goodbye_message
    puts ''
    puts 'Thanks for playing Tic Tac Toe. Goodbye!'
  end

  def play_again
    reset_score_and_board
    display_play_again_message
  end

  def play_next_round
    reset_board
    display_next_round_message
  end

  def display_score_and_board
    display_score
    display_board if human_turn?
  end

  def play
    loop do
      loop do
        display_score_and_board
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          display_board if human_turn?
        end

        change_score_and_clear_screen
        score_points.include?(WINNING_POINTS) ? break : display_result
        play_next_round
      end

      display_match_winner
      play_again? ? play_again : break
    end
  end
end

game = TTTGame.new
game.display_start_playing_message
game.play
game.display_goodbye_message
