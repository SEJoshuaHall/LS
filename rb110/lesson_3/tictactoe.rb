# Tic Tac Toe by Joshua Hall
require 'yaml'
MESSAGES = YAML.load_file('tictactoe_mess.yml')

# INITIALIZING VARIABLES

INITIAL_MARKER = ' '
PLAYER_MARKER = "\e[34m\e[1mX\e[0m"
COMPUTER_MARKER = "\e[31m\e[1mO\e[0m"

how_many_games = 1
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
computer_name = '' 

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
  prompt(MESSAGES['request_board_width'])
  puts ''
  sleep (1)
  prompt(MESSAGES['request_board_width_2'])
  puts ''
  sleep (1)
  prompt(MESSAGES['request_board_width_3'])
  puts ''
  print ' => '
  size = gets.chomp.to_i
end

def set_board_width(board_width)
  board_width = 1
  loop do
    board_width = get_board_width(board_width)
    if board_width.between?(3, 9)
      break
    else
      puts ''
      puts MESSAGES['invalid']
      puts ''
    end
  end
  board_width
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
def title()
  puts "\e[36m\e[1m\e[4m\e[40m#{MESSAGES['title']}\e[0m"
end

def fade(arr)
  arr.map do |char|
    "\e[30m#{char}\e[0m"
  end
end

def display_board(board, board_width, arr_spaces, player_name, computer_name)
  system 'clear'
  half_width = board_width/2
  spots = deep_clone(arr_spaces)
  spots = fade(spots)
  spot_count = deep_clone(arr_spaces)
  current_space = 1
  margin = "    "

  #title
  print margin
  ((half_width*5)-1).times{print ' '}
  title()
  #output top of box
  print margin + ' '
  ((board_width*5)+board_width - 1).times{print '_'}
  puts
  #output all but final rows
  (board_width -1).times do
    #outputs row with number identifying each square
    print margin + '|'
    board_width.times do 
      print spots.shift
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
    puts ''
  end
  #output final row
  print margin + '|'
  
  board_width.times do 
    print spots.shift
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
  puts ''
  puts ''
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

def computer_places_piece!(board, winning_lines, board_width, center_square, computer_name)
  case computer_name
  when "\e[31m\e[1mSilly Sally\e[0m"
    computer_placement_random!(board, winning_lines, board_width, center_square, computer_name)
  when "\e[31m\e[1mRonald Duck\e[0m"
    computer_placement_offense!(board, winning_lines, board_width, center_square, computer_name)
  when "\e[31m\e[1mTuck the Tortoise\e[0m"
    computer_placement_defense!(board, winning_lines, board_width, center_square, computer_name)
  when "\e[31m\e[1mSerious George\e[0m"
    computer_placement_advanced!(board, winning_lines, board_width, center_square, computer_name)
  end
end

def computer_placement_random!(board, winning_lines, board_width, center_square, computer_name)
  computer_places_random!(board)
end

def computer_placement_offense!(board, winning_lines, board_width, center_square, computer_name)
  if computer_offense_move?(board, winning_lines, board_width)
    computer_places_offense!(board, winning_lines, board_width)
  else
    computer_places_random!(board)
  end
end

def computer_placement_defense!(board, winning_lines, board_width, center_square, computer_name)
  if computer_defense_move?(board, winning_lines, board_width)
    computer_places_defense!(board, winning_lines, board_width)
  else
    computer_places_random!(board)
  end
end

def computer_placement_advanced!(board, winning_lines, board_width, center_square, computer_name)
  if computer_offense_move?(board, winning_lines, board_width)
    computer_places_offense!(board, winning_lines, board_width)
  elsif computer_defense_move?(board, winning_lines, board_width)
    computer_places_defense!(board, winning_lines, board_width)
  elsif empty_center?(center_square, board)
    board[center_square] = COMPUTER_MARKER
  else
    computer_places_random!(board)
  end
end

# Methods for game intro
def welcome()
  puts "\e[36m\e[1m\e[4m#{MESSAGES['welcome']}\e[0m"
end

def get_computer_personality(choice)
  loop do 
    system 'clear'
    welcome()
    puts ''
    puts (MESSAGES['choose_personality'])
    sleep(1)
    puts ''
    prompt(MESSAGES['choose_personality_2'])
    sleep(1)
    puts ''
    prompt(MESSAGES['choose_personality_3'])
    prompt(MESSAGES['choose_personality_4'])
    prompt(MESSAGES['choose_personality_5'])
    prompt(MESSAGES['choose_personality_6'])
    puts ''
    print ' => '
    choice = gets.chomp.to_i
    break if (1..4).include?(choice)
    puts MESSAGES['invalid']
  end
  choice
end

def set_computer_personality(computer_name)
  choice = get_computer_personality(choice)
  case choice
  when 1
    computer_name = "\e[31m\e[1mSilly Sally\e[0m"
  when 2
    computer_name = "\e[31m\e[1mRonald Duck\e[0m"
  when 3
    computer_name = "\e[31m\e[1mTuck the Tortoise\e[0m"
  when 4
    computer_name = "\e[31m\e[1mSerious George\e[0m"
  end
  computer_name
end

def intro()
  system 'clear'
  welcome()
  puts ''
  puts (MESSAGES['welcome_2'])
  puts ''
  sleep(1)
  puts (MESSAGES['rules'])
  sleep(1)
  puts (MESSAGES['rules_2'])
  puts ''
  sleep(1)
  puts (MESSAGES['introductions'])
  puts ''
  sleep(2)
end

def intro_computer_player(computer_name)
  system 'clear'
  welcome()
  puts ''
  puts (MESSAGES['comp_intro_1']) + "#{computer_name}" + (MESSAGES['comp_intro_2'])
  puts ''
  sleep(2)
  puts ''
end

def set_player_name(player_name)
  prompt(MESSAGES['name_prompt'])
  puts ''
  print ' => '
  player_name = gets.chomp
  puts ''
  "\e[34m\e[1m#{player_name}\e[0m"
end

def welcome_player(player_name)
  system 'clear'
  welcome()
  puts ''
  sleep(1)
  puts MESSAGES['hello'] + "#{player_name}!"
  puts ''
  sleep(1)
end

def get_number_games(how_many_games)
  puts ''
  loop do
    puts prompt(MESSAGES['num_games'])
    sleep(2)
    puts prompt(MESSAGES['num_games_2'])
    print ' => '
    how_many_games = gets.chomp.to_i
    break if (1..3).include?(how_many_games)
    prompt(MESSAGES['invalid'])
  end
  how_many_games
end

# Methods to determine game play
def get_whos_first(user_choice, player_name, computer_name)
  puts ''
  prompt(MESSAGES['go_first_1'])
  sleep(1)
  puts ''
  prompt(MESSAGES['go_first_2'])
  sleep(1)
  prompt(MESSAGES['go_first_3'] + "#{player_name}")
  prompt(MESSAGES['go_first_4'] + "#{computer_name}")
  prompt(MESSAGES['go_first_5'])
  puts ''
  print ' => '
  user_choice = gets.chomp.to_i
end

def set_whos_first(whos_first, player_name, computer_name)
  loop do
    user_choice = get_whos_first(user_choice, player_name, computer_name)
    case user_choice
    when 1
      whos_first = player_name
      break
    when 2
      whos_first = computer_name
      break
    when 3
      whos_first = [player_name, computer_name].sample
      break
    else
      puts ''
      prompt(MESSAGES['invalid'])
      puts ''
    end
  end
  whos_first
end

def declare_whos_next(whos_next, player_name, computer_name)
  system 'clear'
  welcome()
  puts ''

  if whos_next == player_name
    puts "#{player_name}" + (MESSAGES['announce_who_first'])
  elsif whos_next == computer_name
    puts "#{computer_name}" + (MESSAGES['announce_who_first'])
  end

  sleep(3)
end

def place_piece!(board, whos_next, computer_name, winning_lines, board_width, center_square)
  if whos_next == computer_name
    message_num = rand(1..5)
    random_thinking_message(message_num, computer_name)
    computer_places_piece!(board, winning_lines, board_width, center_square, computer_name)
  else
    player_places_piece!(board)
  end
end

def random_thinking_message(message_num, computer_name)
  case message_num
  when 1 
    puts "#{computer_name}" + (MESSAGES['thinking'])
  when 2 
    puts "#{computer_name}" + (MESSAGES['thinking_2'])
  when 3 
    puts "#{computer_name}" + (MESSAGES['thinking_3'])
  when 4 
    puts "#{computer_name}" + (MESSAGES['thinking_4'])
  when 5 
    puts "#{computer_name}" + (MESSAGES['thinking_5'])
  end
  sleep(rand(2..4))
end

def alternate_player(whos_next, player_name, computer_name)
  if whos_next == computer_name
    whos_next = player_name
  else
    whos_next = computer_name
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

def someone_won?(board, winning_lines, board_width, player_name, computer_name)
  !!detect_winner(board, winning_lines, board_width, player_name, computer_name)
end

def detect_winner(board, winning_lines, board_width, player_name, computer_name)
  winning_lines.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == board_width
      return player_name
    elsif board.values_at(*line).count(COMPUTER_MARKER) == board_width
      return computer_name
    end
  end
  nil
end

def continue_playing(decision)
  prompt(MESSAGES['continue'])
  puts ''
  prompt(MESSAGES['continue_2'])
  prompt(MESSAGES['continue_3'])
  prompt(MESSAGES['continue_4'])
  print " => "
  decide = gets.chomp.to_i
  case decide
  when 1
    return 'y'
  else 
    return 'n'
  end
end

# LOGIC OF PROGRAM

loop do
  intro()
  computer_name = set_computer_personality(computer_name)
  intro_computer_player(computer_name)
  player_name = set_player_name(player_name)
  welcome_player(player_name)
  board_width = set_board_width(board_width)
  decision = 'y'

  #set game parameters based on user input
  board_num_spaces = board_num_spaces(board_width)
  board_spaces = board_arr_spaces(board_num_spaces)
  num_spaces = board_num_spaces(board_width)
  arr_spaces = board_arr_spaces(num_spaces)
  horizontal_starting_nums(board_width)
  winning_lines = winning_lines(winning_lines, board_width, board_spaces)
  center_square = set_center_square(board_width, center_square)
  whos_first = ''
  whos_next = ''

  counter = 0

  loop do
    board = initialize_board(board_num_spaces)

    system 'clear'
    welcome()
    if counter == 0
      how_many_games = get_number_games(how_many_games)
      system 'clear'
      welcome()
      whos_first = set_whos_first(whos_first, player_name, computer_name)
      whos_next = whos_first
      system 'clear'
      welcome()
    end
  
    declare_whos_next(whos_next, player_name, computer_name)

    loop do
      display_board(board, board_width, arr_spaces, player_name, computer_name)
      place_piece!(board, whos_next, computer_name, winning_lines, board_width, center_square)
      whos_next = alternate_player(whos_next, player_name, computer_name)
      break if someone_won?(board, winning_lines, board_width, player_name, computer_name) || board_full?(board)
    end

    display_board(board, board_width, arr_spaces, player_name, computer_name)

    if someone_won?(board, winning_lines, board_width, player_name, computer_name)
      prompt "#{detect_winner(board, winning_lines, board_width, player_name, computer_name)}" + (MESSAGES['won'])
      if detect_winner(board, winning_lines, board_width, player_name, computer_name) == player_name
        player_score += 1
      elsif detect_winner(board, winning_lines, board_width, player_name, computer_name) == computer_name
        computer_score += 1
      end
    else
      prompt(MESSAGES['tie'])
    end

    prompt (MESSAGES['score_update_1']) + "#{computer_name} #{computer_score}" + (MESSAGES['score_update_2']) + "#{player_name} " "#{player_score}" + (MESSAGES['score_update_3'])

    if computer_score == how_many_games
      puts "#{computer_name}" + (MESSAGES['won_tournament'])
    elsif player_score == how_many_games
      puts "#{player_name}" + (MESSAGES['won_tournament'])
    end
    
    counter += 1

  break if player_score == how_many_games ||
            computer_score == how_many_games ||
            continue_playing(decision) != 'y'
  end
  
  play_again = play_again(play_again)  
  
  if play_again != 'y'
    break
  else
    player_score = 0
    computer_score = 0
  end
end

system 'clear'
display_board(board, board_width, arr_spaces, player_name, computer_name)
puts MESSAGES['thanks'] + "#{computer_name}"
