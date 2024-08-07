puts 'What is the bill? '
bill = gets.chomp.to_f
puts 'What is the tip percentage? '
tip = gets.chomp.to_f

total = sprintf('%.2f', ((bill*tip/100)+bill))
tip_amt = sprintf('%.2f', (bill*tip/100))

puts "The tip is $#{tip_amt}"
puts "The total is $#{total}"