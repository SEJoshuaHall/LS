def get_board_width(board_width)
  size = 1
  loop do
    puts 'enter board size'
    puts ''
    size = gets.chomp.to_i
    if size.between?(3, 9)
      break
    else
      puts ''
      puts MESSAGES['invalid']
      puts ''
    end
  end
  board_width = size
end

p get_board_width(1)