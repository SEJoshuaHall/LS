def print_in_box(str, length)
  line_length = str[0].length
  puts '+-' + ('-' * line_length) + '-+'
  puts '| ' + (' ' * line_length) + ' |'
  length.times do
    puts '| ' + str.shift + ' |'
  end
  puts '| ' + (' ' * line_length) + ' |'
  puts '+-' + ('-' * line_length) + '-+'
end

puts "What string would you like me to put in a box?"
user_string = gets.chomp
user_array = []

loop do
  until user_string.empty? 
    user_array << user_string.slice!(0, 79)
  end
  break
end

length = user_array.length

print_in_box(user_array, length)


#Additional, split at ' ' before 80 characters, last line filled up to 80 characters with ' ' so that the box lines up correctly on that side.