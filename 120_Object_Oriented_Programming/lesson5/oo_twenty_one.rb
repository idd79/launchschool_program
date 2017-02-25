# OO Twenty One Game

class Deck
  attr_reader :cards

  def initialize
    shuffle_cards!
  end

  def shuffle_cards!
    @cards = ((('2'..'10').to_a + ['J', 'Q', 'K', 'A']) * 4).shuffle
  end

  def deal(num)
    cards.pop(num)
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(cards_array)
    @cards += cards_array
  end

  def [](idx)
    @cards[idx]
  end
end

class Score
  def initialize(player1, player2)
    @scores = { player1 => 0, player2 => 0 }
  end

  def add_point(participant)
    @scores[participant.name] += 1
  end

  def display_total
    puts ''
    puts "---> The total score is <---"
    @scores.each { |k, v| puts "++ #{k}: #{v}/#{Game::WINNING_POINTS}" }
    puts ''
  end

  def to_s
    @scores
  end
end

class Participant
  attr_accessor :name, :hand

  def initialize
    set_name
    hand_reset
  end

  def hand_reset
    self.hand = Hand.new
  end

  def busted?
    hand_total > Game::WIN_SCORE
  end

  def hit_21?
    hand_total == Game::WIN_SCORE
  end

  def hand_total_without_aces
    hand.cards.inject(0) do |sum, card|
      case card
      when 'J', 'Q', 'K'
        sum + 10
      when 'A'
        sum
      else
        sum + card.to_i
      end
    end
  end

  def hand_total
    sum = hand_total_without_aces
    aces = hand.cards.select { |item| item == 'A' }
    if aces.empty?
      sum
    else
      aces.size.times do
        sum += sum <= (Game::WIN_SCORE - 11 - aces.size + 1) ? 11 : 1
      end
    end

    sum
  end
end

class Player < Participant
  def set_name
    ans = ''
    loop do
      puts "What's your name?"
      ans = gets.chomp.strip
      break unless ans.empty?
      puts "Sorry, you must enter a value."
    end
    self.name = ans
  end

  def hit_or_stay?
    right_ans = ['h', 'hit', 's', 'stay']
    ans = ''
    loop do
      puts "=> Do you want to '(h)it' or '(s)tay'?"
      ans = gets.chomp
      break if right_ans.include?(ans)
      puts "=> That's not a valid choice. Please try again..."
    end

    ans.downcase.start_with?('h') ? 'hit' : 'stay'
  end
end

class Dealer < Participant
  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number\ 5).sample
  end
end

class Game
  attr_reader :player, :dealer, :deck, :scores

  WIN_SCORE = 21
  DEALER_FLOOR = 17
  WINNING_POINTS = 2

  def initialize
    display_welcome_message
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    display_lets_play_message
  end

  def play
    loop do
      reset_scores
      play_rounds
      display_match_winner
      break unless play_again?
      clear_screen
      puts "Let's play again #{player.name}!"
    end
    display_end_game_message
  end

  private

  def prompt(message)
    puts "=> #{message}"
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def reset_scores
    @scores = Score.new(player.name, dealer.name)
  end

  def reset_game
    @deck = Deck.new
    player.hand_reset
    dealer.hand_reset
  end

  def display_welcome_message
    clear_screen
    puts 'Welcome to Twenty One!'
    puts ''
  end

  def display_lets_play_message
    puts ''
    puts "Hi #{player.name}! Let's play..."
    puts ''
    sleep(2)
    clear_screen
  end

  def assign_cards
    player.hand << deck.deal(2)
    dealer.hand << deck.deal(2)
  end

  def deal_cards(participant, num)
    participant.hand << deck.deal(num)
  end

  def print_cards(hand)
    last_item = hand.cards.last
    hand.cards[0, hand.cards.length - 1].join(', ') + ' and ' + last_item.to_s
  end

  def display_cards(participant)
    prompt "#{participant.name} has: #{print_cards(participant.hand)}. " \
           "Total: #{participant.hand_total}."
  end

  def display_cards_start
    prompt "#{dealer.name} has: #{dealer.hand[0]} and unknown card."
    display_cards(player)
  end

  def display_players_turn_message
    puts ''
    prompt("Player's turn...")
  end

  def players_turn
    display_players_turn_message

    loop do
      break if player.busted? || player.hit_21?
      puts ""
      players_choice = player.hit_or_stay?

      break if players_choice == 'stay'
      deal_cards(player, 1)
      puts ""
      display_cards(player)
    end
  end

  def display_dealers_turn_message
    puts ''
    prompt "Dealer's turn..."
    sleep(2)
  end

  def dealers_turn
    display_dealers_turn_message
    puts ''

    loop do
      display_cards(dealer)
      break if dealer.hand_total >= DEALER_FLOOR
      puts 'Dealer hits...'
      puts ''
      sleep(2)
      deal_cards(dealer, 1)
    end

    if (DEALER_FLOOR...WIN_SCORE).cover?(dealer.hand_total)
      puts "Dealer stays..."
    end
  end

  def player_won?
    (player.hand_total > dealer.hand_total && !player.busted?) || dealer.busted?
  end

  def dealer_won?
    !player_won? && player.hand_total != dealer.hand_total
  end

  def match_winner
    winner = scores.to_s.select { |_, v| v == WINNING_POINTS }
    winner.keys.first
  end

  def display_winner_and_add_point
    puts ''
    sleep(2)

    if player_won?
      scores.add_point(player)
      prompt "Player has won!"
    elsif dealer_won?
      scores.add_point(dealer)
      prompt "Dealer has won!"
    else
      prompt "It's a tie!"
    end
  end

  def display_next_round_message
    puts ''
    puts "Let's play next round...(Press Enter to continue)"
    gets.chomp
    clear_screen
  end

  def display_match_winner
    puts ''
    case match_winner
    when player.name then puts "Congratulations! You have won the match!"
    else puts "#{dealer.name} has won the match!"
    end
  end

  def display_end_game_message
    puts ''
    clear_screen
    puts "Thanks for playing. Good bye!"
  end

  def participants_turn
    players_turn unless player.hit_21?
    dealers_turn unless player.hit_21? || player.busted?
  end

  def play_rounds
    loop do
      reset_game
      scores.display_total
      assign_cards
      display_cards_start
      participants_turn
      display_winner_and_add_point
      break if match_winner

      display_next_round_message
    end
  end

  def play_again?
    ans = nil
    loop do
      puts ''
      print "Would you like to play again? (y/n) "
      ans = gets.chomp.downcase
      break if %w(yes y no n).include? ans
      puts ''
      puts "That's not a valid answer! Please try again"
    end

    %(yes y).include?(ans)
  end
end

game = Game.new
game.play
