solution = nil

puts "Enter the first number: "
first = gets.chomp.to_i
puts "Enter the second number: "
second = gets.chomp.to_i

puts "What operation would you like to perform? (enter +, -, *, /, %, or **): "
operation = gets.chomp

if operation == '+'
  solution = first + second
elsif operation == '-'
  solution = first - second
elsif operation == '*'
  solution = first * second
elsif operation == '/'
  solution = first / second
elsif operation == '%'
  solution = first % second
elsif operation == '**'
  solution = first ** second
else
  solution = 'Invalid operation.'
end

puts solution