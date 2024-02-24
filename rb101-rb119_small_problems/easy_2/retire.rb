puts "What is your age? "
age = gets.chomp.to_i
puts "At what age would you like to retire? "
retire_at = gets.chomp.to_i

years_away = retire_at - age
this_year = Time.new
retire_year = this_year.year + years_away

puts "It's #{this_year.year}. You will retire in #{retire_year}."
puts "You have only #{years_away} years of work to go!"