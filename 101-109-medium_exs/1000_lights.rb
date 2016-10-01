# 1000 Lights

def lights_toggle_init(num)
  hash = {}
  1.upto(num) { |n| hash[n] = 1 }
  hash
end

def lights_toggling(num)
  lights = lights_toggle_init(num)
  2.upto(num) do |round|
    lights.select { |k, _| k % round == 0 }.each_key { |k| lights[k] += 1 }
  end
  lights
end

def lights_on(num)
  lights_toggling(num).select { |_, v| v.odd? }.keys
end

def print_lights_on(num)
  puts 'The lights left on are: ' + lights_on(num).join(', ')
end

print_lights_on(5)
print_lights_on(1000)
puts lights_on(1000).size
