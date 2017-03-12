# Exercise 120-Lesson 5. Medium 1

class Minilang
  OPS = { ADD: :+, SUB: :-, MULT: :*, DIV: :/, MOD: :% }.freeze

  def initialize(string)
    @string = string
    @stack = []
    @reg = 0
  end
  
  def eval
    @string.split.each do |item|
      unless OPS.keys.include?(item.to_sym) || item =~ /^-?\d+$/ ||
             %w(PUSH PRINT POP).include?(item)
        puts "Invalid token: #{item}"
        return
      end

      case item
      when /^-?\d+$/ then @reg = item.to_i
      when 'PUSH' then @stack << @reg
      when 'PRINT' then puts @reg
      when 'POP'
        if @stack.empty?
          puts "Empty stack!"
          return
        end
        @reg = @stack.pop
      else
        if @stack.empty?
          puts "Empty stack!"
          return
        end
        @reg = [@reg, @stack.pop].reduce(OPS[item.to_sym])
      end
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('3 PUSH 5 SUB PRINT').eval
# 2

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
