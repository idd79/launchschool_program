# Bannerizer - surroung a string within a box

def print_in_box(string)
  size = string.size
  puts "+" + "-"*(size + 2) + "+"
  puts "|" + " "*(size + 2) + "|"
  puts "| " + string + " |"
  puts "|" + " "*(size + 2) + "|"
  puts "+" + "-"*(size + 2) + "+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

def wrap(string, width)
  result = ''
  string.split.each do |word|
    size_last_line = result.lines.last.nil? ? 0 : result.lines.last.lstrip.size
    if (size_last_line + word.size + 1) > width
      result << "\n" + word
    else
      result << ' ' + word
    end
  end
  result.lstrip
end

p wrap('To boldly go where no one has gone before.', 60)

def print_in_box_wrap(string, width, align = 'left')
  width = string.size if string.size < width
  puts '+' + '-' * (width + 2) + '+'
  puts '|' + ' ' * (width + 2) + '|'
  wrap(string, width).lines.each do |line|
    case align
    when 'center' then puts '| ' + line.chomp.center(width) + ' |'
    when 'right' then puts '| ' + line.chomp.rjust(width) + ' |'
    else puts '| ' + line.chomp.ljust(width) + ' |'
    end
  end
  puts '|' + ' ' * (width + 2) + '|'
  puts '+' + '-' * (width + 2) + '+'
end

print_in_box_wrap('To boldly go where no one has gone before.', 10)
print_in_box_wrap('To boldly go where no one has gone before.', 13, 'center')
print_in_box_wrap('To boldly go where no one has gone before.', 20, 'center')
