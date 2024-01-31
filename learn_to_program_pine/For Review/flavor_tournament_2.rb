@flavors = []
winner = ''
$running_flavor = []


def ask_for_flavors
  loop do
    puts "Would you like to add a flavor? (y\/n)"
    puts
    add_flavor = gets.chomp.downcase
    puts 
    if add_flavor == 'y'
      puts "What flavor would you like to add?"
      flav = gets.chomp.downcase
      @flavors<<flav
      puts "You have successfully added that flavor!"
      puts
    else
      break
    end
  end
  puts
end

def determine_winner(running_flavor)
  
  $running_flavor<<@flavors.pop
  loop do
    until @flavors.pop == nil
      $running_flavor<<@flavors.pop
      loop do
        puts 'Which flavor is your favorite?'
        puts "0. " + $running_flavor[0].to_s + " or 1. " + $running_flavor[1].to_s
        user_selection = gets.chomp.downcase
        if user_selection == '0'
          $running_flavor[1].delete
        elsif user_selection == '1'
          $running_flavor[0].delete
        else puts "Please enter 0 or 1!"
        end
      end
    end
  end
  winner = $running_flavor.to_s
end


      

puts "Welcome to ULTIMATE FLAVOR TOURNAMENT!"
puts


determine_winner(ask_for_flavors)

puts "And the Ultimate Flavor Champion is:"
puts winner.upcase+"!!"
