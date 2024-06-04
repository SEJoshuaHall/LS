arr = []
puts "Enter the 1st number: "
arr << gets.chomp.to_i 
puts "Enter the 2nd number: "
arr << gets.chomp.to_i 
puts "Enter the 3rd number: "
arr << gets.chomp.to_i 
puts "Enter the 4th number: "
arr << gets.chomp.to_i 
puts "Enter the 5th number: "
arr << gets.chomp.to_i 
puts "Enter the last number: "
check = gets.chomp.to_i

if arr.include?(check)
  puts "The number #{check} appears in #{arr}."
else
  puts "The number #{check} does not appear in #{arr}."
end