puts "What is your name?"
name = gets.chomp

if name[-1] == '!'
  puts "HELLO #{name.slice(0...-1).upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end