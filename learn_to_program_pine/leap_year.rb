puts "Welcome to the Leap Year finder!"
puts "Please enter a year:"
year = gets.chomp.to_i

if (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))
  puts "That was a Leap Year!"
else
  puts "That was not a Leap Year!"
end
