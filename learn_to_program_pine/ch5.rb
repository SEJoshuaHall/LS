puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
total_letters = first_name.length.to_i + last_name.length.to_i 
puts "Did you know there are #{total_letters} letters in your name?"