# OO RPS game

class Move
  VALUES = %w(rock paper scissors)

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    if rock? 
      return true if other_move.scissors?
      return false
    elsif paper?
      return true if other_move.rock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return false
    end
  end

  def <(other_move)
    if rock? 
      return true if other_move.paper?
      return false
    elsif paper?
      return true if other_move.scissors?
      return false
    elsif scissors?
      return true if other_move.rock?
      return false
    end
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
      puts 'Please choose rock, paper, or scissors:'
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

# Game Orchestration engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hi #{human.name}. Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing. Good bye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end

  #   case human.move
  #   when 'rock'
  #     puts "It's a tie!" if computer.move == 'rock'
  #     puts "#{human.name} won!" if computer.move == 'paper'
  #     puts "#{human.name} lost!" if computer.move == 'scissors'
  #   when 'paper'
  #     puts "It's a tie!" if computer.move == 'paper'
  #     puts "#{human.name} won!" if computer.move == 'rock'
  #     puts "#{human.name} lost!" if computer.move == 'scissors'
  #   when 'scissors'
  #     puts "It's a tie!" if computer.move == 'scissors'
  #     puts "#{human.name} won!" if computer.move == 'paper'
  #     puts "#{human.name} lost!" if computer.move == 'rock'
  #   end
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
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
