USERNAME = 'admin'.freeze
PASSWORD = 'SecreT'.freeze

loop do
  puts '>> Please enter user name:'
  username = gets.chomp
  puts '>> Pleaes enter your password:'
  password = gets.chomp

  break if [username, password] == [USERNAME, PASSWORD]
  puts '>> Authorization failed'
end

puts 'Welcome!'
