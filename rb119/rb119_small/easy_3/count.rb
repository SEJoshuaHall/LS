puts "Please write word or multiple words: "
input = gets.chomp

count = 0
input.chars.each {|char| count += 1 unless char == ' '}
puts "there are #{count} characters in \"#{input}\""