puts "Enter the room length in meters: "
length = gets.chomp.to_f
puts "Enter the room width in meters: "
width = gets.chomp.to_f

area = length * width
sq_feet = area * 10.7639

puts "The area of the room is #{area} square meters (#{sq_feet} square feet)."