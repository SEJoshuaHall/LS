puts "What is your age?"
current_age = gets.chomp.to_i

puts"At what age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year
years_left = retire_age - current_age

puts "It's #{current_year}. You will retire in #{current_year + years_left}."
puts "You have only #{years_left} years of work to go!"