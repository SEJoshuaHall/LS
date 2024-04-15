
def play_again(play_again)
  puts "Play again? (y or n)"
    puts ''
    print ' => '
    answer = gets.chomp.downcase.chars.first
end
play_again = ''
p play_again(play_again)