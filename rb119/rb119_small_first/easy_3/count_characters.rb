puts "Please enter a word or set of words: "
input = gets.chomp

user_array = input.chars
user_array.delete(' ')
puts "There are #{user_array.count} characters in \"#{input}\"."