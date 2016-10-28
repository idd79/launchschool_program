# Stack machine interpretation

OPS = { ADD: :+, SUB: :-, MULT: :*, DIV: :/, MOD: :% }.freeze
ERROR = 'Error: Invalid argument'.freeze
ERROR2 = 'Error: Invalid number of arguments'.freeze

def minilang(string)
  stack = []
  reg = 0

  string.split.each do |item|
    unless OPS.keys.include?(item.to_sym) || item =~ /^\d+$/ ||
           %w(PUSH PRINT POP).include?(item)
      return ERROR
    end
    
    case item
    when /^\d+?/ then reg = item.to_i
    when 'PUSH' then stack << reg
    when 'PRINT' then puts reg
    when 'POP'
      return ERROR2 if stack.empty?
      reg = stack.pop
    else
      return ERROR2 if stack.empty?
      reg = [reg, stack.pop].reduce(OPS[item.to_sym])
    end
  end
  nil
end

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT')
minilang('4 PUSH PUSH 7 MOD MULT PRINT')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')
minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
minilang('5 MULT PRINT')
