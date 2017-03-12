# Exercise 120-Lesson 5. Medium 1

class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUITS_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def suit_value
    SUITS_VALUES[suit]
  end

  def <=>(other_card)
    [value, suit_value] <=> [other_card.value, other_card.suit_value]
  end
end

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'
puts cards.max
puts cards.max == Card.new('Jack', 'Spades')

cards = [Card.new(4, 'Diamonds'),
         Card.new(4, 'Clubs'),
         Card.new(4, 'Spades'),
         Card.new(4, 'Hearts'),
         Card.new(5, 'Diamonds')
       ].shuffle
puts "cards:"
puts cards
puts "cards.sort:"
puts cards.sort
