# Unlucky days

require 'date'

def friday_13th?(year)
  date_init = Date.new(year) 
  date_end = Date.new(year + 1) - 1
  date_init.upto(date_end).count { |day| day.friday? && day.day == 13}
end

p friday_13th?(2015) == 3
p friday_13th?(1986) == 1

# Solution by launchschool

def friday_13th_2?(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  11.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end
