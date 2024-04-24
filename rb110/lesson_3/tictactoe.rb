# Tic Tac Toe by Joshua Hall
require 'yaml'
MESSAGES = YAML.load_file('tictactoe_mess.yml')

# DEFINING METHODS

# Methods for formatting output
def prompt(msg)
  puts "\n => #{msg}"
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

# Methods for configuring board size and implementup

def deep_clone(arr)
  arr.map { |el| el.is_a?(Array) ? deep_clone(el) : el }
end

def get_board_width(_board_width)
  prompt(MESSAGES['request_board_width'])
  sleep(1)
  prompt(MESSAGES['request_board_width_2'])
  sleep(1)
  prompt(MESSAGES['request_board_width_3'])
  print ' => '
  gets.chomp.to_i
end

def implement_board_width(board_width)
  loop do
    board_width = get_board_width(board_width)
    if board_width.between?(3, 9)
      break
    else
      puts "\n#{MESSAGES['invalid']}\n"
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
def title
  puts "\e[36m\e[1m\e[4m\e[40m#{MESSAGES['title']}\e[0m"
end

def fade(arr)
  arr.map do |char|
    "\e[30m#{char}\e[0m"
  end
end

def display_board(board, board_width, arr_spaces, _player_name, _computer_name)
  system 'clear'
  half_width = board_width / 2
  spots = deep_clone(arr_spaces)
  spots = fade(spots)
  spot_count = deep_clone(arr_spaces)
  current_space = 1
  margin = "    "

  # print title
  print margin
  ((half_width * 5) - 1).times { print ' ' }
  title
  
  # output top of box
  print "#{margin} "
  ((board_width * 5) + board_width - 1).times { print '_' }
  puts
  # output all but final rows
  (board_width - 1).times do
    # outputs row with number identifying each square
    print "#{margin}|"
    board_width.times do
      print spots.shift
      if spot_count.shift > 9
        print "   |"
      else
        print "    |"
      end
    end
    puts
    # outputs rows with Os and Xs
    print "#{margin}|"
    board_width.times do
      print "  #{(board[current_space])}  |"
      current_space += 1
    end
    puts
    # outputs row at bottom of game row
    print "#{margin}|"
    (board_width).times { print '     |' }
    puts
    # outputs bottom of box
    print "#{margin}|"
    (board_width - 1).times { print '-----+' }
    print "-----|\n"
  end
  # output final row
  print "#{margin}|"

  board_width.times do
    print spots.shift
    if spot_count.shift > 9
      print "   |"
    else
      print "    |"
    end
  end
  puts
  # outputs rows with Os and Xs
  print "#{margin}|"
  board_width.times do
    print "  #{board[current_space]}  |"
    current_space += 1
  end
  puts
  # outputs bottom of box
  print "#{margin}|"
  board_width.times { print '_____|' }
  puts "\n\n"
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

def implement_center_square(board_width, _center_square)
  if board_width.even?
    nil
  else
    ((board_width**2) + 1) / 2
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
  winning_lines += winning_verticle(board_width, board_spaces)
  winning_lines += winning_horizontal(board_width, board_spaces)
  winning_lines
end

def winning_diagonal(board_width, _board_arr_spaces)
  arr = [1]
  counter = 1
  loop do
    arr << ((board_width * counter) + counter + 1)
    counter += 1
    break if counter == board_width
  end
  arr
end

def winning_reverse_diagonal(board_width, _board_arr_spaces)
  arr = []
  counter = 1
  loop do
    arr << ((board_width * counter) - counter + 1)
    counter += 1
    break if counter == board_width + 1
  end
  arr
end

def winning_verticle(board_width, _board_arr_spaces)
  board_width_arr = (1..board_width).to_a
  board_width_arr.map do |element|
    sub_arr = []
    board_width.times do
      sub_arr << element
      element += board_width
    end
    sub_arr
  end
end

def winning_horizontal(board_width, _board_arr_spaces)
  horizontal_start_num_arr = horizontal_starting_nums(board_width)
  horizontal_start_num_arr.map do |element|
    sub_arr = []
    board_width.times do
      sub_arr << element
      element += 1
    end
    sub_arr
  end
end

# Methods for determining and making moves

def player_places_piece!(board)
  square = ''
  loop do
    prompt(MESSAGES['where_place'] +
          "#{joinor(empty_squares(board))}." +
          MESSAGES['where_place_2'] + "\n")
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
  board[center_square] == ' '
end

def computer_places_piece!(board, winning_lines, board_width, center_square,
                           computer_name)
  case computer_name
  when "\e[31m\e[1mSilly Sally\e[0m"
    computer_placement_random!(board, winning_lines, board_width,
                               center_square, computer_name)
  when "\e[31m\e[1mRonald Duck\e[0m"
    computer_placement_offense!(board, winning_lines, board_width,
                                center_square, computer_name)
  when "\e[31m\e[1mTuck the Tortoise\e[0m"
    computer_placement_defense!(board, winning_lines, board_width,
                                center_square, computer_name)
  when "\e[31m\e[1mSerious George\e[0m"
    computer_placement_advanced!(board, winning_lines, board_width,
                                 center_square, computer_name)
  end
end

def computer_placement_random!(board, _winning_lines, _board_width,
                               _center_square, _computer_name)
  computer_places_random!(board)
end

def computer_placement_offense!(board, winning_lines, board_width,
                                _center_square, _computer_name)
  if computer_offense_move?(board, winning_lines, board_width)
    computer_places_offense!(board, winning_lines, board_width)
  else
    computer_places_random!(board)
  end
end

def computer_placement_defense!(board, winning_lines, board_width,
                                _center_square, _computer_name)
  if computer_defense_move?(board, winning_lines, board_width)
    computer_places_defense!(board, winning_lines, board_width)
  else
    computer_places_random!(board)
  end
end

def computer_placement_advanced!(board, winning_lines, board_width,
                                 center_square, _computer_name)
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
def welcome
  puts "\e[36m\e[1m\e[4m#{MESSAGES['welcome']}\e[0m"
end

def ask_computer_personality
  system 'clear'
  welcome
  puts "\n#{(MESSAGES['choose_personality'])}" + "\n"
  sleep(1)
  prompt(MESSAGES['choose_personality_2'] + "\n")
  sleep(1)
  prompt(MESSAGES['choose_personality_3'] + "\n => " + MESSAGES['choose_personality_4'] + "\n => " + MESSAGES['choose_personality_5'] + "\n => " + MESSAGES['choose_personality_6'] + "\n")
  print "\n => "
  gets.chomp.to_i
end

def get_computer_personality(choice)
  loop do
    choice = ask_computer_personality
    break if (1..4).include?(choice)
    puts MESSAGES['invalid']
    sleep(2)
  end
  choice
end

def implement_computer_personality(computer_name)
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

def intro
  system 'clear'
  welcome
  puts("\n" + MESSAGES['welcome_2'] + "\n\n")
  sleep(1)
  puts(MESSAGES['rules'])
  sleep(2)
  puts(MESSAGES['rules_2'] + "\n")
  sleep(2)
  puts(MESSAGES['rules_3'] + "\n\n")
  sleep(2)
  puts(MESSAGES['enter_to_continue'])
  gets.chomp
end

def intro_computer_player(computer_name)
  system 'clear'
  welcome
  puts ("\n" + MESSAGES['comp_intro_1']) + computer_name.to_s +
       (MESSAGES['comp_intro_2'] + "\n")
  sleep(2)
end

def implement_player_name
  name = ''
  loop do
  prompt(MESSAGES['name_prompt'] + "\n")
  print ' => '
  name = gets.chomp
  break unless name == ''
  puts ("\n" + MESSAGES['invalid'] + "\n")
  end
  "\e[34m\e[1m#{name}\e[0m"
end

def welcome_player(player_name)
  system 'clear'
  welcome
  sleep(1)
  puts "\n" + MESSAGES['hello'] + "#{player_name}!\n"
  sleep(1)
end

def get_number_games(how_many_games)
  puts "\n"
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
def get_whos_first(_user_choice, player_name, computer_name)
  prompt(MESSAGES['go_first_1'])
  sleep(1)
  prompt(MESSAGES['go_first_2'])
  sleep(1)
  prompt(MESSAGES['go_first_3'] + "#{player_name.to_s}" + "\n => " + MESSAGES['go_first_4'] + "#{computer_name.to_s}" + "\n => " + MESSAGES['go_first_5'])
  print ' => '
  gets.chomp.to_i
end

def implement_whos_first(whos_first, player_name, computer_name)
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
      prompt("\n" + MESSAGES['invalid'] + "\n")
    end
  end
  whos_first
end

def declare_whos_next(whos_next, player_name, computer_name)
  system 'clear'
  welcome
  puts "\n"

  if whos_next == player_name
    puts player_name.to_s + (MESSAGES['announce_who_first'])
  elsif whos_next == computer_name
    puts computer_name.to_s + (MESSAGES['announce_who_first'])
  end

  sleep(3)
end

def place_piece!(board, whos_next, computer_name, winning_lines, board_width,
                 center_square)
  if whos_next == computer_name
    message_num = rand(1..5)
    random_thinking_message(message_num, computer_name)
    computer_places_piece!(board, winning_lines, board_width, center_square,
                           computer_name)
  else
    player_places_piece!(board)
  end
end

def random_thinking_message(message_num, computer_name)
  message_for_num = {1 => 'thinking', 2 => 'thinking_2', 3 => 'thinking_3', 4 => 'thinking_4', 5 => 'thinking_5'} 
  thinking_message = MESSAGES[message_for_num[message_num]]
  puts computer_name.to_s + thinking_message
  sleep(rand(2..4))
end

def alternate_player(whos_next, player_name, computer_name)
  if whos_next == computer_name
    player_name
  else
    computer_name
  end
end

def play_again(_play_again)
  answer = ''
  loop do
    prompt(MESSAGES['play_again'] + "\n")
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

def continue_playing(_decision)
  prompt(MESSAGES['continue'] + "\n")
  prompt(MESSAGES['continue_2'])
  prompt(MESSAGES['continue_3'])
  prompt(MESSAGES['continue_4'])
  print " => "
  decide = gets.chomp.to_i
  case decide
  when 1
    'y'
  else
    'n'
  end
end

# INITIALIZING VARIABLES

INITIAL_MARKER = ' '
PLAYER_MARKER = "\e[34m\e[1mX\e[0m"
COMPUTER_MARKER = "\e[31m\e[1mO\e[0m"

how_many_games = 1
num_spaces = 0
arr_spaces = []
board_num_spaces = 0
board = {}
board_width = 1
center_square = 0

winning_lines = []

player_name = ''
computer_name = ''

player_score = 0
computer_score = 0

whos_next = ''
play_again = ''

# LOGIC OF PROGRAM

loop do
  intro
  computer_name = implement_computer_personality(computer_name)
  intro_computer_player(computer_name)
  player_name = implement_player_name
  welcome_player(player_name)
  board_width = implement_board_width(board_width)
  decision = 'y'

  # implement game parameters based on user input
  board_num_spaces = board_num_spaces(board_width)
  board_spaces = board_arr_spaces(board_num_spaces)
  num_spaces = board_num_spaces(board_width)
  arr_spaces = board_arr_spaces(num_spaces)
  horizontal_starting_nums(board_width)
  winning_lines = winning_lines(winning_lines, board_width, board_spaces)
  center_square = implement_center_square(board_width, center_square)
  whos_first = ''
  whos_next = ''

  counter = 0

  loop do
    board = initialize_board(board_num_spaces)

    system 'clear'
    welcome
    if counter == 0
      how_many_games = get_number_games(how_many_games)
      system 'clear'
      welcome
      whos_first = implement_whos_first(whos_first, player_name, computer_name)
      whos_next = whos_first
      system 'clear'
      welcome
    end

    declare_whos_next(whos_next, player_name, computer_name)

    loop do
      display_board(board, board_width, arr_spaces, player_name, computer_name)
      place_piece!(board, whos_next, computer_name, winning_lines, board_width,
                   center_square)
      whos_next = alternate_player(whos_next, player_name, computer_name)
      break if someone_won?(board, winning_lines, board_width, player_name,
                            computer_name) || board_full?(board)
    end

    display_board(board, board_width, arr_spaces, player_name, computer_name)

    if someone_won?(board, winning_lines, board_width, player_name,
                    computer_name)
      prompt detect_winner(board, winning_lines, board_width, player_name,
                           computer_name).to_s + (MESSAGES['won'])
      if detect_winner(board, winning_lines, board_width, player_name,
                       computer_name) == player_name
        player_score += 1
      elsif detect_winner(board, winning_lines, board_width, player_name,
                          computer_name) == computer_name
        computer_score += 1
      end
    else
      prompt(MESSAGES['tie'])
    end

    prompt (MESSAGES['score_update_1']) +
           "#{computer_name} #{computer_score}" +
           (MESSAGES['score_update_2']) +
           "#{player_name} " "#{player_score}" +
           (MESSAGES['score_update_3'])

    if computer_score == how_many_games
      puts computer_name.to_s + (MESSAGES['won_tournament'])
    elsif player_score == how_many_games
      puts player_name.to_s + (MESSAGES['won_tournament'])
    end

    counter += 1

    break if player_score == how_many_games ||
             computer_score == how_many_games ||
             continue_playing(decision) != 'y'
  end

  play_again = play_again(play_again)

  if play_again == 'y'
    player_score = 0
    computer_score = 0
  else
    break
  end
end

system 'clear'
display_board(board, board_width, arr_spaces, player_name, computer_name)
puts MESSAGES['thanks'] + computer_name.to_s
