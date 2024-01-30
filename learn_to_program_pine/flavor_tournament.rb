match1 = ['vanilla', 'chocolate']
match2 = ['rhubarb', 'pistachio']
match3 = ['strawberry', 'pineapple']
match4 = ['tang', 'orange']
match5 = []
match6 = []
match7 = []
winner = nil

def ask_for_winner(flavors)
  puts "0. "+flavors[0]
  puts "1. "+flavors[1]
  
  while true
    answer = gets.chomp.downcase
    if (answer == "0" || answer == "1")
      return flavors[answer.to_i]
    else
      puts "Please answer '0' or '1'!"
    end
  end
end

puts "Welcome to ULTIMATE FLAVOR TOURNAMENT!"
puts
puts "MATCH 1: Which flavor is best?"
match5[0] = ask_for_winner(match1)
puts
puts "MATCH 2: Which flavor is best?"
match5[1] = ask_for_winner(match2)
puts
puts "MATCH 3: Which flavor is best?"
match6[0] = ask_for_winner(match3)
puts
puts "MATCH 4: Which flavor is best?"
match6[1] = ask_for_winner(match4)
puts
puts "MATCH 5: Which flavor is best?"
match7[0] = ask_for_winner(match5)
puts
puts "MATCH 6: Which flavor is best?"
match7[1] = ask_for_winner(match6)
puts
puts "MATCH 7: Which flavor is best?"
winner = ask_for_winner(match7)
puts
puts "And the Ultimate Flavor Champion is:"
puts winner.upcase+"!!"
