# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

def after_midnigt(time)
  hours = time.split(':')[0]
  mins = time.split(':')[1]
  (hours.to_i * 60 + mins.to_i) % 1440
end

def before_midnight(time)
  hours = time.split(':')[0]
  mins = time.split(':')[1]
  1440 - (hours.to_i * 60 + mins.to_i)
end
