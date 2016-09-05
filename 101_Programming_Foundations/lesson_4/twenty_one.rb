# twenty_one.rb

def prompt(message)
  puts "=> #{message}"
end

def prompt_with_space(message)
  puts ""
  puts "=> #{message}"
end

def valid_integer?(input, lower_limit, upper_limit)
  input =~ /^\d+$/ && (lower_limit..upper_limit).cover?(input.to_i)
end

def clear_screen
  system('clear') || system('cls')
end

def print_cards_values(cards)
  last_item = cards.last
  cards[0, cards.length - 1].join(', ') + ' and ' + last_item.to_s
end

def display_dealers_cards_initial(cards)
  prompt "Dealer has: #{cards[0]} and unknown card"
end

def display_cards(cards, person)
  prompt "#{person} has: #{print_cards_values(cards)}. Total: #{total(cards)}."
end

def total_without_aces(cards)
  cards.inject(0) do |sum, card|
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

def total(cards)
  sum = total_without_aces(cards)
  aces = cards.select { |item| item == 'A' }
  if aces.empty?
    sum
  else
    aces.size.times { sum += sum <= (WIN_SCORE - 11 - aces.size + 1) ? 11 : 1 }
  end
  sum
end

def ask_player_hit_or_stay
  right_ans = ['h', 'hit', 's', 'stay']
  ans = ''
  loop do
    prompt "Do you want to 'hit' or 'stay'?"
    ans = gets.chomp
    break if right_ans.include?(ans)
    prompt "That's not a valid choice. Please try again..."
  end
  ans = ans.downcase.start_with?('h') ? 'hit' : 'stay'
end

def busted?(cards)
  total(cards) > WIN_SCORE
end

def got_win_score?(cards)
  total(cards) == WIN_SCORE
end

def busted_or_21_msg(cards, person)
  if busted?(cards)
    prompt "#{person} has lost this round!"
  elsif got_win_score?(cards)
    prompt "#{person} has won this round!"
  end
end

def play_next_round?
  right_ans = ['y', 'yes', 'n', 'no', 'nop']
  answer = ''
  loop do
    prompt_with_space "Do you want to play the next round?"
    answer = gets.chomp
    break if right_ans.include?(answer)
    prompt "Please answer 'yes' or 'no'..."
  end
  answer.downcase.start_with?('y')
end

def add_score_busted_or_21(score, players_cards, dealers_cards)
  if busted?(dealers_cards) || got_win_score?(players_cards)
    score['player'] += 1
  elsif busted?(players_cards) || got_win_score?(dealers_cards)
    score['dealer'] += 1
  end
end

def add_score(score, players_cards, dealers_cards)
  if total(players_cards) > total(dealers_cards)
    score['player'] += 1
  elsif total(players_cards) < total(dealers_cards)
    score['dealer'] += 1
  end
end

def display_score(score)
  prompt "The score is: " \
         "Player = #{score['player']}/5; Dealer = #{score['dealer']}/5"
end

def busted_or_21?(cards)
  busted?(cards) || got_win_score?(cards)
end

def display_final_msg
  prompt_with_space "Thanks for playing. Good bye!"
end

clear_screen
prompt "Welcome to Twenty-one!"

win_score = ''
loop do
  prompt_with_space "Choose a winning score " \
                    "(a number between 21 and 51, inclusive):"
  win_score = gets.chomp
  break if valid_integer?(win_score, 21, 51)
  prompt "That's an invalid entry. Please try again..."
end
WIN_SCORE = win_score.to_i

dealer_floor = ''
loop do
  prompt_with_space "Choose when dealer stays (e.g. 17):"
  dealer_floor = gets.chomp
  break if valid_integer?(dealer_floor, 0, WIN_SCORE)
  prompt "That's an invalid entry. Please try again..."
end

prompt_with_space "Lets start..."
puts ""
sleep(1)
clear_screen

score_board = { 'player' => 0, 'dealer' => 0 }

loop do
  deck = ((('2'..'10').to_a + ['J', 'Q', 'K', 'A']) * 4).sample(52)
  # or,
  # deck = ((('2'..'10').to_a + ['J', 'Q', 'K', 'A']) * 4).shuffle

  players_cards = deck.pop(2)
  dealers_cards = deck.pop(2)

  display_score(score_board)
  puts ""

  display_dealers_cards_initial(dealers_cards)
  display_cards(players_cards, 'Player')

  prompt_with_space "Player's turn..." unless got_win_score?(players_cards)

  loop do
    break if busted?(players_cards) || got_win_score?(players_cards)
    puts ""
    players_choice = ask_player_hit_or_stay

    break if players_choice == 'stay'
    players_cards << deck.pop
    puts ""
    display_cards(players_cards, 'Player')
  end

  if busted_or_21?(players_cards)
    busted_or_21_msg(players_cards, 'Player')
    add_score_busted_or_21(score_board, players_cards, dealers_cards)
    break if score_board.values.include?(5)
    break unless play_next_round?
    clear_screen
    next
  end

  prompt_with_space "Dealer's turn..." unless got_win_score?(dealers_cards)
  puts ""
  sleep(2)

  loop do
    display_cards(dealers_cards, "Dealer")
    break if total(dealers_cards) >= dealer_floor.to_i
    prompt "Dealer hits..."
    puts ""
    sleep(2)
    dealers_cards << deck.pop
  end

  if busted_or_21?(dealers_cards)
    busted_or_21_msg(dealers_cards, 'Dealer')
    add_score_busted_or_21(score_board, players_cards, dealers_cards)
    break if score_board.values.include?(5)
    break unless play_next_round?
    clear_screen
    next
  end

  if total(players_cards) > total(dealers_cards)
    prompt_with_space "Player has won this round!"
  elsif total(players_cards) == total(dealers_cards)
    prompt_with_space "It's a tie!"
  else
    prompt_with_space "Dealer has won this round!"
  end

  add_score(score_board, players_cards, dealers_cards)

  break if score_board.values.include?(5)
  break unless play_next_round?
  clear_screen
end

puts ""
display_score(score_board)
if score_board['player'] == 5
  prompt_with_space "Player has won the match!"
elsif score_board['dealer'] == 5
  prompt_with_space "Dealer has won the match!"
end

display_final_msg
