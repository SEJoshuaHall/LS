puts "What is your first name?"
first_name = gets.chomp
puts "What is your middle name?"
middle_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp

puts "Hi #{first_name} #{middle_name} #{last_name}!"

puts "What is your favorite number?"
fav_num = gets.chomp
bigger_num = fav_num.to_i + 1
puts "#{bigger_num} is a bigger and better number!"