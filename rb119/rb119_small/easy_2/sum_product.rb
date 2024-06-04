puts "Please enter an integer greater than 0: "
int = gets.chomp.to_i

puts "Please enter 's' to compute the sum, 'p' to compute the product: "
operation = gets.chomp

sum = (1..int).inject(:+)
product = (1..int).inject(:*)


if operation == 's'
  puts  "The sum of the integers between 1 and #{int} is #{sum}"
elsif operation == 'p'
  puts "The product of the integers between 1 and #{int} is #{product}"
end