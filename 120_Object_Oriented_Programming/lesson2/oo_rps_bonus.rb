# OO RPS game with bonus features

class Move
  VALUES = %w(rock paper scissors lizard spock).freeze

  WIN_CONDITIONS = { 'rock'     => %w(scissors lizard),
                     'paper'    => %w(rock spock),
                     'scissors' => %w(paper lizard),
                     'lizard'   => %w(paper spock),
                     'spock'    => %w(scissors rock) }.freeze

  LOSS_CONDITIONS = { 'rock'     => %w(paper spock),
                      'paper'    => %w(scissors lizard),
                      'scissors' => %w(rock spock),
                      'lizard'   => %w(rock scissors),
                      'spock'    => %w(paper lizard) }.freeze

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
      puts "Hello! What's your name?"
      ans = gets.chomp.strip
      break unless ans.empty?
      puts "Sorry, must enter a value."
    end
    self.name = ans
  end

  def choose
    choice = ''
    loop do
      puts ' '
      puts '--> Please choose rock, paper, scissors, lizard, or spock:'
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts 'Sorry, invalid choice. Please try again!'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  attr_accessor :moves_history

  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number5).sample
  end

  def cumulative_dist(sorted_array)
    return sorted_array if sorted_array.length == 1

    cumul_dist = [sorted_array[0]]
    1.upto(sorted_array.length - 1) do |x|
      cumul_dist << sorted_array[x] + cumul_dist[x - 1]
    end

    cumul_dist
  end

  def choose_weighted(distribution = {})
    cumul_dist = cumulative_dist(distribution.values.sort)
    distribution = distribution.sort_by { |_, v| v }
    sorted_options = distribution.each_with_object([]) { |x, a| a << x[0] }

    r = rand
    choice = sorted_options[cumul_dist.find_index { |x| r < x }]
    self.move = Move.new(choice)
  end

  def choose_random
    self.move = Move.new(Move::VALUES.sample)
  end

  def choose_smart
    return choose_random if moves_history.total_moves_count < 2

    dist = moves_history.human_moves_count
    target = dist.select { |_, v| v == dist.values.max }.keys.sample

    choice = Move::LOSS_CONDITIONS[target].sample
    self.move = Move.new(choice)
  end

  def choose
    case name
    when 'R2D2'    then choose_smart
    when 'Hal'     then choose_weighted('rock' => 0.3, 'lizard' => 0.7)
    when 'Chappie' then choose_random
    when 'Sonny'   then choose_weighted('rock' => 1)
    when 'Number5' then choose_weighted('rock' => 0.05,
                                        'lizard' => 0.05,
                                        'scissors' => 0.7,
                                        'paper' => 0.1,
                                        'spock' => 0.1)
    end
  end
end

class History
  def initialize(human, computer)
    @human = human
    @computer = computer
    @history = { human.name => [], computer.name => [] }
  end

  def add_moves
    @history[@human.name] << @human.move.to_s
    @history[@computer.name] << @computer.move.to_s
  end

  def display_all
    puts '--> The moves history is:'
    @history.each { |k, v| puts "#{k} => #{v}" }
  end

  def total_moves_count
    @history.values.first.count
  end

  def human_moves_count
    values = Move::VALUES

    distribution = Hash.new(0)
    values.each { |m| distribution[m] = @history[@human.name].count(m) }

    distribution
  end
end

class Score
  def initialize(player1, player2)
    @score = { player1 => 0, player2 => 0 }
  end

  def add_point(player)
    @score[player.name] += 1
  end

  def display_players_and_points
    puts '--> The score is:'
    @score.each { |k, v| puts "#{k} = #{v}" }
  end

  def return_points_all
    @score.values
  end

  def return_points_player(player_name)
    @score[player_name]
  end
end

# Game Orchestration engine
class RPSGame
  attr_accessor :human, :computer, :score, :history

  WINNING_POINTS = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new(human, computer)
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
    computer.moves_history = history
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
      add_score(human)
    elsif human.move < computer.move
      add_score(computer)
    end
  end

  def display_match_winner
    if score.return_points_player(human.name) == WINNING_POINTS
      puts "#{human.name} won the match!"
    else
      puts "#{computer.name} won the match!"
    end
  end

  def display_history
    history.display_all
  end

  def play_again?
    ans = ''
    loop do
      puts 'Do you want to play again? (y/n)'
      ans = gets.chomp.downcase
      break if %w(yes no y n).include? ans
      puts "Sorry, must be y or n."
    end
    %w(yes y).include? ans
  end

  def play
    loop do
      reset_score

      loop do
        display_history
        players_choose
        display_moves
        display_winner
        history.add_moves
        change_total_score
        score.display_players_and_points
        break if score.return_points_all.include?(WINNING_POINTS)
      end

      display_match_winner
      break unless play_again?
    end
  end
end

game = RPSGame.new
game.display_welcome_message
game.play
game.display_goodbye_message
