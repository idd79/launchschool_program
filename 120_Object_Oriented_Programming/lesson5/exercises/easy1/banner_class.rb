# Lesson 5 - Easy 1 exercises

class Banner
  MAX_WIDTH = 77

  def initialize(message, width = 0)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def max_word_width
    return 0 if @message.empty?
    @message.split.max_by(&:size).size
  end

  def box_size
    return [@message.size + 2, MAX_WIDTH].min if @width.zero?
    [[@width, max_word_width].max, MAX_WIDTH].min + 2
  end

  def horizontal_rule
    "+" + "-" * box_size + "+"
  end

  def empty_line
    "|" + " " * box_size + "|"
  end

  def wrap(string, width)
    result = string.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
    result.lstrip.split("\n")
  end

  def message_line
    return "|#{' '.center(box_size)}|" if @message.empty?

    wrap(@message, box_size - 2).map do |line|
      '|' + line.chomp.center(box_size) + '|'
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 2)
puts banner

banner = Banner.new('')
puts banner
