# Tic Tac Toe by Joshua Hall
# Note: you will need to install rainbow gem to run this code: 'gem install rainbow'. Pry must also be installed.

require 'rainbow/refinement'
using Rainbow

require 'pry'

require 'yaml'
MESSAGES = YAML.load_file('tictactoe_mess.yml')

# INITIALIZING VARIABLES

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'.blue.bright
COMPUTER_MARKER = 'O'.red.bright

# Default game values

# num_spaces = 0
# arr_spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# horizontal_starting_nums = [1, 2, 3]
# board_num_spaces = 9
# board = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
# board_width = 3

# winning_lines = [[1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9]]

num_spaces = 0
arr_spaces = []
horizontal_starting_nums = []
board_num_spaces = 0
board = {}
board_width = 1
center_square = 0

winning_lines = []
winning_diagonal = []
winning_reverse_diagonal = []
winning_verticle = []
winning_horizontal = []

player_name = ''
computer_name = Rainbow('Serious George').red.bright

player_score = 0
computer_score = 0

whos_next = ''
play_again = ''

# DEFINING METHODS

# Methods for formatting output
def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# Methods for configuring board size and setup

def deep_clone(arr)
  arr.map { |el| el.is_a?(Array) ? deep_clone(el) : el }
end

def get_board_width(board_width)
  size = 1
  loop do
    prompt(MESSAGES['request_board_width'])
    puts ''
    print ' => '
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

def board_num_spaces(board_width)
  board_width * board_width
end

def board_arr_spaces(board_num_spaces)
  arr = []
  (1..board_num_spaces).each do |num|
    arr << num
  end
  arr
end

# rubocop:disable Metrics/AbcSize
def display_board(board, board_width, arr_spaces, player_name, computer_name)
  system 'clear'
  half_width = board_width/2
  spots = deep_clone(arr_spaces)
  spot_count = deep_clone(arr_spaces)
  current_space = 1
  margin = "    "

  #title
  print margin
  ((half_width*5)-1).times{print ' '}
  puts "Tic Tac Toe".cyan.bright.underline.background(:black) 
  #output top of box
  print margin + ' '
  ((board_width*5)+board_width - 1).times{print '_'}
  puts
  #output all but final rows
  (board_width -1).times do
    #outputs row with number identifying each square
    print margin + '|'
    board_width.times do 
      print Rainbow(spots.shift.to_s).black
      if spot_count.shift > 9
        print "   |"
      else
        print "    |"
      end
    end
    puts
    #outputs rows with Os and Xs
    print margin + '|'
    board_width.times do 
      print "  " + "#{board[current_space]}" + "  |" 
      current_space += 1
    end
    puts
    #outputs row at bottom of game row
    print margin + '|'
    (board_width).times{print '     |'}
    puts
    #outputs bottom of box
    print margin + '|'
    (board_width - 1).times{print '-----+'}
    print "-----|"
    puts
  end
  #output final row
  print margin + '|'
  
  board_width.times do 
    print Rainbow(spots.shift.to_s).black
    if spot_count.shift > 9
      print "   |"
    else
      print "    |"
    end
  end
  puts
  #outputs rows with Os and Xs
  print margin + '|'
  board_width.times do 
    print "  #{board[current_space]}  |" 
    current_space += 1
  end
  puts
  #outputs bottom of box
  print margin + '|'
  board_width.times{print '_____|'}
  puts
end
# rubocop:enable Metrics/AbcSize

def initialize_board(board_num_spaces)
  new_board = {}
  (1..board_num_spaces).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def set_center_square(board_width, center_square)
  if board_width.even?
    return nil
  else
    ((board_width**2)+1)/2
  end
end

def horizontal_starting_nums(board_width)
  horizontal_num = 1
  horizontal_start_num_arr = []
  loop do
    horizontal_start_num_arr << horizontal_num
    horizontal_num += board_width
    break if horizontal_num > board_width * board_width
  end
  horizontal_start_num_arr
end

# Methods for determining winning moves

def winning_lines(winning_lines, board_width, board_spaces)
  winning_lines << winning_diagonal(board_width, board_spaces)
  winning_lines << winning_reverse_diagonal(board_width, board_spaces)
  winning_lines = winning_lines + winning_verticle(board_width, board_spaces)
  winning_lines = winning_lines + winning_horizontal(board_width, board_spaces)
  winning_lines
end

def winning_diagonal(board_width, board_arr_spaces)
  arr = [1]
  counter = 1
  loop do
    arr << board_width * counter + counter + 1
    counter += 1
    break if counter == board_width
  end
  arr
end

def winning_reverse_diagonal(board_width, board_arr_spaces)
  arr = []
  counter = 1
  loop do
    arr << board_width * counter - counter + 1
    counter += 1
    break if counter == board_width + 1
  end
  arr
end

def winning_verticle(board_width, board_arr_spaces)
  arr = []
  board_width_arr = (1..board_width).to_a
  arr = board_width_arr.map do |element|
    sub_arr = []
    board_width.times do
      sub_arr << element 
      element += board_width
    end
    sub_arr
  end
  arr
end

def winning_horizontal(board_width, board_arr_spaces)
  arr = []
  horizontal_start_num_arr = horizontal_starting_nums(board_width)
  arr = horizontal_start_num_arr.map do |element|
    sub_arr = []
    board_width.times do
    sub_arr << element
    element += 1
    end
    sub_arr
  end
  arr
end

# Methods for determining and making moves

def player_places_piece!(board)
  square = ''
  loop do
    prompt(MESSAGES['where_place'] + "#{joinor(empty_squares(board))}." + MESSAGES['where_place_2'])
    puts ''
    print ' => '
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt(MESSAGES['invalid'])
  end
  board[square] = PLAYER_MARKER
end

def computer_defense_move?(board, winning_lines, board_width)
  winning_lines.any? do |line|
    board.values_at(*line).count(PLAYER_MARKER) == (board_width - 1) &&
    board.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def computer_offense_move?(board, winning_lines, board_width)
  winning_lines.any? do |line|
    board.values_at(*line).count(COMPUTER_MARKER) == (board_width - 1) &&
    board.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def computer_places_defense!(board, winning_lines, board_width)
  matches = winning_lines.select do |line|
    board.values_at(*line).count(PLAYER_MARKER) == board_width - 1 &&
    board.values_at(*line).count(INITIAL_MARKER) == 1
  end

  select_match = matches.sample
  place_at = select_match.select do |e|
    board[e] == ' '
  end
  place_at = place_at[0]
  board[place_at] = COMPUTER_MARKER
  board
end

def computer_places_offense!(board, winning_lines, board_width)
  matches = winning_lines.select do |line|
    board.values_at(*line).count(COMPUTER_MARKER) == board_width - 1 &&
    board.values_at(*line).count(INITIAL_MARKER) == 1
  end

  select_match = matches.sample
  place_at = select_match.select do |e|
    board[e] == ' '
  end
  place_at = place_at[0]
  board[place_at] = COMPUTER_MARKER
  board
end

def computer_places_random!(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
end

def empty_center?(center_square, board)
  if board[center_square] == ' '
    return true
  else
    false
  end
end

def computer_places_piece!(board, winning_lines, board_width, center_square)
  if computer_offense_move?(board, winning_lines, board_width)
    computer_places_offense!(board, winning_lines, board_width)
  elsif computer_defense_move?(board, winning_lines, board_width)
    computer_places_defense!(board, winning_lines, board_width)
  elsif empty_center?(center_square, board)
    board[center_square] = COMPUTER_MARKER
  else
    computer_places_random!(board)
  end
  binding.pry
end

# Methods for game intro

def intro(computer_name, board_width)
  system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''
  sleep(1)
  puts (MESSAGES['comp_intro_1']) + "#{computer_name}" + (MESSAGES['comp_intro_2'])
  puts ''
  sleep(2)
  puts (MESSAGES['rules'])
  puts (MESSAGES['rules_2'])
  puts ''
  sleep(3)
end

def set_player_name(player_name)
  prompt(MESSAGES['name_prompt'])
  puts ''
  print ' => '
  player_name = gets.chomp
  puts ''
  player_name.blue.bright
end

def welcome(player_name)
  system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''
  sleep(1)
  puts MESSAGES['hello'] + "#{player_name}!"
  puts ''
  sleep(1)
end

# Methods to determine game play

def get_whos_next(whos_next)
  loop do
    puts ''
    prompt(MESSAGES['go_first_1'])
    sleep(1)
    prompt(MESSAGES['go_first_2'])
    sleep(1)
    prompt(MESSAGES['go_first_3'])
    puts ''
    print ' => '
    user_response = gets.chomp
    case user_response.chars.first.downcase
    when 'y'
      whos_next = 'player'
      break
    when 'n'
      whos_next = 'computer'
      break
    when 'c'
      whos_next = ['player', 'computer'].sample
      break
    else
      puts ''
      prompt(MESSAGES['invalid'])
      puts ''
    end
  end
  whos_next
end

def declare_whos_next(whos_next, player_name, computer_name)
  system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''

  if whos_next == 'player'
    puts "#{player_name}" + (MESSAGES['announce_who_first'])
  else
    puts "#{computer_name}" + (MESSAGES['announce_who_first'])
  end

  sleep(3)
end

def place_piece!(board, whos_next, computer_name, winning_lines, board_width, center_square)
  if whos_next == 'computer'
    puts "#{computer_name} " + (MESSAGES['thinking'])
    sleep(rand(2..4))
    computer_places_piece!(board, winning_lines, board_width, center_square)
  else
    player_places_piece!(board)
  end
end

def alternate_player(whos_next)
  if whos_next == 'computer'
    whos_next = 'player'
  else
    whos_next = 'computer'
  end
end

def play_again(play_again)
  answer = ''
  loop do
    prompt(MESSAGES['play_again'])
    puts ''
    print ' => '
    answer = gets.chomp.downcase.chars.first
    if answer == 'y' || answer == 'n'
      break
    else
      puts MESSAGES['invalid']
    end
  end
  answer
end

# Methods to determin game end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board, winning_lines, board_width)
  !!detect_winner(board, winning_lines, board_width)
end

def detect_winner(board, winning_lines, board_width)
  winning_lines.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == board_width
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == board_width
      return 'Computer'
    end
  end
  nil
end

# LOGIC OF PROGRAM

loop do
  intro(computer_name, board_width)
  player_name = set_player_name(player_name)
  welcome(player_name)
  board_width = get_board_width(board_width)

  #set game parameters based on user input
  board_num_spaces = board_num_spaces(board_width)
  board_spaces = board_arr_spaces(board_num_spaces)
  num_spaces = board_num_spaces(board_width)
  arr_spaces = board_arr_spaces(num_spaces)
  horizontal_starting_nums(board_width)
  winning_lines = winning_lines(winning_lines, board_width, board_spaces)
  center_square = set_center_square(board_width, center_square)

  counter = 0

  loop do
    board = initialize_board(board_num_spaces)

    system 'clear'
    puts Rainbow(MESSAGES['welcome']).cyan.bright.underline

    case counter
    when 0
      whos_next = get_whos_next(whos_next) 
    else
      whos_next = alternate_player(whos_next)
    end
    
    declare_whos_next(whos_next, player_name, computer_name)

    counter += 1

    loop do
      display_board(board, board_width, arr_spaces, player_name, computer_name)
      place_piece!(board, whos_next, computer_name, winning_lines, board_width, center_square)
      whos_next = alternate_player(whos_next)
      break if someone_won?(board, winning_lines, board_width) || board_full?(board)
    end

    display_board(board, board_width, arr_spaces, player_name, computer_name)

    if someone_won?(board, winning_lines, board_width)
      prompt "#{detect_winner(board, winning_lines, board_width)}" + (MESSAGES['won'])
      if detect_winner(board, winning_lines, board_width) == 'Player'
        player_score += 1
      elsif detect_winner(board, winning_lines, board_width) == 'Computer'
        computer_score += 1
      end
    else
      prompt(MESSAGES['tie'])
    end

    prompt (MESSAGES['score_update_1']) + "#{computer_name} #{computer_score}" + (MESSAGES['score_update_2']) + "#{player_name} " "#{player_score}" + (MESSAGES['score_update_3'])

    if computer_score == 5
      puts "#{computer_name}" + (MESSAGES['won'])
    elsif player_score == 5
      puts "#{player_name}" + (MESSAGES['won'])
    end
    break if computer_score == 5 || player_score == 5
    
    play_again = play_again(play_again)
    
    break unless play_again == 'y'

  end
  
  break unless play_again == 'y'

end

system 'clear'
display_board(board, board_width, arr_spaces, player_name, computer_name)
puts MESSAGES['thanks'] + "#{computer_name}"
