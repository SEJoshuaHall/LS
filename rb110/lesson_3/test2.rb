def get_number_games(how_many_games)
  game_type = ''
  loop do
    puts 'num_games_2'
    game_type = gets.chomp.downcase.chars.first
    break if ['t', 'm', 'g'].include?(game_type)
    prompt(MESSAGES['invalid'])
  end
  case game_type
  when 't'
    5
  when 'm'
    3
  when 'g'
    1
  end 
end

p get_number_games(1)