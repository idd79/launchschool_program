# Exercise 120-Lesson 5. Medium 1

class PingGame

  def initialize(lb, ub)
    @range = (lb..ub)
    @guesses = []
    @target = @range.to_a.sample
    @max_guesses = Math.log2(ub - lb).to_i + 1
  end

  def guesses_remaining
    @max_guesses - @guesses.size
  end

  def display_guesses_remaining
    puts ''
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def ask_for_guess
    guess = nil
    loop do
      display_guesses_remaining
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp
      break if @range.cover?(guess.to_i) && /\A[1-9]\d*\z/.match(guess)
      print "Ivalid guess. "
    end
    @guesses << guess.to_i
  end

  def display_low_or_high
    if @guesses.last < @target
      puts "Your guess is too low"
    elsif @guesses.last > @target
      puts "Your guess is too high"
    end
  end

  def play
    loop do
      break if @guesses.last == @target || guesses_remaining.zero?
      ask_for_guess
      display_low_or_high
    end

    if @guesses.last == @target
      puts "You win!"
    else
      puts "You are out of guesses. You lose."
    end
  end
end

game = PingGame.new(501, 1500)
game.play
