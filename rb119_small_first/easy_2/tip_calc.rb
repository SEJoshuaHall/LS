puts "What is the bill? "
bill = gets.chomp.to_f

puts 'What is the tip percentage? '
tip_percent = gets.chomp.to_f

tip = (bill * tip_percent) / 100
total = bill + tip


puts "The tip is $#{format('%.2f',tip)}"
puts "The total is $#{format('%.2f',total)}"

#Solved Further Exploration using another student's solution for format.