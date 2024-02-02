winner = ''
winning_flavor = ''

def ask_for_flavors(flavors)
  loop do
    puts "Would you like to add a flavor? (y\/n)"
    puts
    add_flavor = gets.chomp.downcase
    puts 
    if add_flavor == 'y'
      puts "What flavor would you like to add?"
      flav = gets.chomp.downcase
      flavors = flavors.push(flav)
      puts "You have successfully added that flavor!"
      puts
    else
      break
    end
  end
  return flavors
end

def determine_winner(flavors)
  while flavors.count() >1
    puts 'Which flavor is your favorite?'
    puts "0. " + flavors[0] + " or 1. " + flavors[1]
    user_entry = gets.chomp.to_i

    if user_entry == 0
      puts "You chose " + flavors[0]
      flavors.delete_at(1)
    elsif user_entry == 1
      puts "You chose " + flavors[1]
      flavors.delete_at(0)
     else
      puts "Your entry was invalid. Please enter '0' or '1'."
    end
  end
  puts "And the Ultimate Flavor Champion is:"
  puts flavors[0].to_s.upcase + "!!"
end




puts "Welcome to ULTIMATE FLAVOR TOURNAMENT!"
puts

flavors = []
determine_winner(ask_for_flavors(flavors))

