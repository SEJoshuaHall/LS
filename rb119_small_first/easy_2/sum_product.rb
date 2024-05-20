puts 'Please enter an integer greater than 0: '
original_integer = gets.chomp.to_i
unless original_integer > 0
  puts "You did not enter a positive integer. Goodbye."
  exit
end

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp.downcase

integer = original_integer
integer_2 = original_integer
count = integer
count_2 = integer
sum = integer
product = integer

loop do
  integer -= 1
  sum += integer
  count -= 1
  break if count == 0
end

loop do
  integer_2 -= 1
  product *= integer_2
  count_2 -= 1
  break if  count_2 == 1
end

if operation == 's'
  puts "The sum of the integers between 1 and #{original_integer} is #{sum}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{original_integer} is #{product}."
else
  puts "You did not enter a valid operation."
end

