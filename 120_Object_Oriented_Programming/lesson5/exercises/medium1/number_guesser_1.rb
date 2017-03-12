# Exercise 120-Lesson 5. Medium 1

class PingGame
  MAX_GUESSES = 7

  def initialize
    @guesses = []
    @target = (1..100).to_a.sample
  end

  def guesses_remaining
    MAX_GUESSES - @guesses.size
  end

  def display_guesses_remaining
    puts ''
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def ask_for_guess
    guess = nil
    loop do
      display_guesses_remaining
      print "Enter a number between 1 and 100: "
      guess = gets.chomp
      break if (1..100).cover?(guess.to_i) && /\A[1-9]\d*\z/.match(guess)
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

game = PingGame.new
game.play
