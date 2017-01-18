# OO RPS game with bonus features

class Move
  VALUES = %w(rock paper scissors lizard spock).freeze

  WIN_CONDITIONS = { "rock" => %w(scissors lizard),
                     "paper" => %w(rock spock),
                     "scissors" => %w(paper lizard),
                     "lizard" => %w(paper spock),
                     "spock" => %w(scissors rock) }.freeze

  LOSS_CONDITIONS = { "rock" => %w(paper spock),
                      "paper" => %w(scissors lizard),
                      "scissors" => %w(rock spock),
                      "lizard" => %w(rock scissors),
                      "spock" => %w(paper lizard) }.freeze

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WIN_CONDITIONS[@value].include?(other_move.to_s)
  end

  def <(other_move)
    LOSS_CONDITIONS[@value].include?(other_move.to_s)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    ans = ''
    loop do
      puts "What's your name?"
      ans = gets.chomp
      break unless ans.empty?
      puts "Sorry, must enter a value."
    end
    self.name = ans
  end

  def choose
    choice = ''
    loop do
      puts 'Please choose rock, paper, scissors, lizard, or spock:'
      choice = gets.chomp
      break if Move::VALUES.include? choice.downcase
      puts 'Sorry, invalid choice. Please try again!'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number\ 5).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Score
  def initialize(player1, player2)
    @score = { player1 => 0, player2 => 0 }
  end

  def add_point(player)
    @score[player] += 1
  end

  def display_players_and_points
    puts 'The score is:'
    @score.each do |k, v|
      puts "#{k} = #{v}"
    end
  end

  def return_all_points
    @score.values
  end

  def return_points(player)
    @score[player]
  end
end

# Game Orchestration engine
class RPSGame
  attr_accessor :human, :computer, :score

  POINTS = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def reset_score
    self.score = Score.new(human.name, computer.name)
  end

  def display_welcome_message
    puts "Hi #{human.name}. Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing. Good bye!"
  end

  def players_choose
    human.choose
    computer.choose
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def add_score(player)
    score.add_point(player)
  end

  def change_total_score
    if human.move > computer.move
      add_score(human.name)
    elsif human.move < computer.move
      add_score(computer.name)
    end
  end

  def display_match_winner
    if score.return_points(human.name) == POINTS
      puts "#{human.name} won the match!"
    else
      puts "#{computer.name} won the match!"
    end
  end

  def play_again?
    ans = ''
    loop do
      puts 'Do you want to play again? (y/n)'
      ans = gets.chomp
      break if %w(yes no y n).include? ans.downcase
      puts "Sorry, must be y or n."
    end
    %w(yes y).include? ans.downcase
  end

  def play
    display_welcome_message

    loop do
      reset_score

      loop do
        players_choose
        display_moves
        display_winner
        change_total_score
        score.display_players_and_points
        break if score.return_all_points.include?(POINTS)
      end

      display_match_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
