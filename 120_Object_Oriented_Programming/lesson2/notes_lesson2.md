# Notes on Lesson 2 - 120 OOP

## OO Rock Paper Scissors

### Approach to OOP

The classical approach to object oriented programming is:

1. Write a textual description of the problem or exercise.
2. Extract the major nouns and verbs from the description.
3. Organize and associate the verbs with the nouns.
4. The nouns are the classes and the verbs are the behaviors or methods.

Notice that in OO, we don't think about the game flow logic at all. It's all about organizing and modularizing the code into a cohesive structure - classes. After we come up with the initial class definitions, the final step is to orchestrate the flow of the program using objects instantiated from the classes.

### Major nouns and verbs in our RPS game

**Nouns**: players, moves, rules.
**Verbs**: choose, compares

Note that we decided to ignore "rock", "paper" or "scissors", since they are all variations on a move -- almost like different states of a move. Therefore, we capture the major noun: move.

Now let's organize the verbs with nouns:

```ruby
Player
  - Choose
Move
Rules

compare
```

Notice that a "Player" can "choose", but Move" and "Rule" don't have any verbs at all, and we aren't sure where to put "compare". This is an awkward first attempt, but it's all we are comfortable assuming at this point.

The following is a preliminary structure of the game:

```ruby
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play
```

**Note**: See files oo_rps.rb and oo_rps2.rb for the implementation of the OO RPS game.

## Coding tips

- Explore the problem before design.
- Repetitive nouns in method names is a sign that you're missing a class. In our Rock, Paper, Scissors game for example, if we find ourselves constantly referring to a "move", it may be a sign that we should encapsulate the logic into a Move class (which is what we did).
- When naming methods, don't include the class name. Something like `class Player` and `def player_info` should be avoided. In that case `def info` would read much better.
- Avoid long method invocation chain. For example, avoid something like `human.move.display.size`. If human.move returns nil, then the entire method invocation chain blows up, and it's very hard to debug the error.
- Avoid design patterns for now. One of the biggest mistakes beginner programmers make is mis-application of "best practices" or "design patterns" to improve performance or flexibility. This is such a common phenomenon that experienced programmers have a quote: "premature optimization is the root of all evil". Don't worry about optimization at this point. Don't write overly clever code.

