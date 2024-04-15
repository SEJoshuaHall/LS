# Tic Tac Toe
# Note: you will need to install rainbow gem to run this code: 'gem install rainbow'

require 'rainbow/refinement'
using Rainbow

require 'yaml'
MESSAGES = YAML.load_file('tictactoe_mess.yml')

#INITIALIZING VARIABLES

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'.blue.bright
COMPUTER_MARKER = 'O'.red.bright

num_spaces = 0
arr_spaces = []
horizontal_starting_nums = []
board_num_spaces = 0
board = {}
board_width = 0

winning_lines = []
winning_diagonal = []
winning_reverse_diagonal = []
winning_verticle = []
winning_horizontal = []

player_name = ''
computer_name = Rainbow('Serious George').red.bright

player_score = 0
computer_score = 0

whos_first = ''
play_again = ''

#DEFINING METHODS

def prompt(msg)
  puts "=> #{msg}"
end

# methods for configuring board size and setup

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

# rubocop:disable Metrics/AbcSize
def display_board(brd, player_name, computer_name)
  # system 'clear'
  puts "       " + "Tic Tac Toe".cyan.bright.underline.background(:black)
  puts "    _________________"
  puts "   |" + Rainbow('1').black + "    |" + Rainbow('2').black + "    |" + Rainbow('3').black + "    |"
  puts "   |  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  |"
  puts "   |     |     |     |"
  puts "   |-----+-----+-----|"
  puts "   |" + Rainbow('4').black + "    |" + Rainbow('5').black + "    |" + Rainbow('6').black + "    |"
  puts "   |  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  |"
  puts "   |     |     |     |"
  puts "   |-----+-----+-----|"
  puts "   |" + Rainbow('7').black + "    |" + Rainbow('8').black + "    |" + Rainbow('9').black + "    |"
  puts "   |  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  |"
  puts "   |_____|_____|_____|" 
  puts ""
  puts "#{player_name} is #{PLAYER_MARKER}. #{computer_name} is #{COMPUTER_MARKER}."
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt(MESSAGES['where_place'] + "#{joinor(empty_squares(brd))}." + MESSAGES['where_place_2'])
    puts ''
    print ' => '
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt(MESSAGES['invalid'])
  end

  brd[square] = PLAYER_MARKER
end

def computer_defense_move?(brd, winning_lines)
  winning_lines.any? do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def computer_offense_move?(brd, winning_lines)
  winning_lines.any? do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def computer_places_defense!(brd, winning_lines)
  matches = winning_lines.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
  end

  select_match = matches.sample
  if brd[select_match[0]] == ' '
    brd[select_match[0]] = COMPUTER_MARKER
  elsif brd[select_match[1]] == ' '
    brd[select_match[1]] = COMPUTER_MARKER 
  elsif brd[select_match[2]] == ' '
    brd[select_match[2]] = COMPUTER_MARKER
  end
  brd
end

def computer_places_offense!(brd, winning_lines)
  matches = winning_lines.select do |line|
  brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
  brd.values_at(*line).count(INITIAL_MARKER) == 1
  end

  select_match = matches.sample

  if brd[select_match[0]] == ' '
    brd[select_match[0]] = COMPUTER_MARKER
  elsif brd[select_match[1]] == ' '
    brd[select_match[1]] = COMPUTER_MARKER 
  elsif brd[select_match[2]] == ' '
    brd[select_match[2]] = COMPUTER_MARKER
  end
  brd
end

def computer_places_random!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end


def computer_places_piece!(brd, winning_lines)
  if computer_offense_move?(brd, winning_lines)
    computer_places_offense!(brd, winning_lines)
  elsif computer_defense_move?(brd, winning_lines)
    computer_places_defense!(brd, winning_lines)
  elsif brd[5] == ' '
    brd[5] = COMPUTER_MARKER
  else
    computer_places_random!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, winning_lines)
  !!detect_winner(brd, winning_lines)
end

def detect_winner(brd, winning_lines)
  winning_lines.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def intro(computer_name, board_width)
  # system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''
  sleep(1)
  puts (MESSAGES['comp_intro_1']) + "#{computer_name}" + (MESSAGES['comp_intro_2'])
  puts ''
  sleep(2)
  puts (MESSAGES['rules'])
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
  # system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''
  sleep(1)
  puts MESSAGES['hello'] + "#{player_name}!"
  puts ''
  sleep(1)
end

def get_whos_first(whos_first)
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
      whos_first = 'player'
      break
    when 'n'
      whos_first = 'computer'
      break
    when 'c'
      whos_first = ['player', 'computer'].sample
      break
    else
      puts ''
      prompt(MESSAGES['invalid'])
      puts ''
    end
  end
  whos_first
end

def declare_whos_first(whos_first, player_name, computer_name)
  # system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''

  if whos_first == 'player'
    puts "#{player_name}" + (MESSAGES['announce_who_first'])
  else
    puts "#{computer_name}" + (MESSAGES['announce_who_first'])
  end

  sleep(3)
end

def place_piece!(board, whos_first, computer_name, winning_lines)
  if whos_first == 'computer'
    puts "#{computer_name} " + (MESSAGES['thinking'])
    sleep(rand(2..4))
    computer_places_piece!(board, winning_lines)
  else
    player_places_piece!(board)
  end
end

def alternate_player(whos_first)
  if whos_first == 'computer'
    whos_first = 'player'
  else
    whos_first = 'computer'
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

# LOGIC OF PROGRAM

loop do
  intro(computer_name, board_width)

  player_name = set_player_name(player_name)

  welcome(player_name)

  board_width = get_board_width(board_width)
  board_num_spaces = board_num_spaces(board_width)
  board_spaces = board_arr_spaces(board_num_spaces)
  num_spaces = board_num_spaces(board_width)
  arr_spaces = board_arr_spaces(num_spaces)
  horizontal_starting_nums(board_width)
  winning_lines = winning_lines(winning_lines, board_width, board_spaces)

  counter = 0

  loop do
    board = initialize_board

    # system 'clear'
    puts Rainbow(MESSAGES['welcome']).cyan.bright.underline

    whos_first = get_whos_first(whos_first) if counter == 0

    declare_whos_first(whos_first, player_name, computer_name)

    counter += 1

    loop do
      display_board(board, player_name, computer_name)
      place_piece!(board, whos_first, computer_name, winning_lines)
      whos_first = alternate_player(whos_first)
      break if someone_won?(board, winning_lines) || board_full?(board)
    end

    display_board(board, player_name, computer_name)

    if someone_won?(board, winning_lines)
      prompt "#{detect_winner(board, winning_lines)}" + (MESSAGES['won'])
      if detect_winner(board, winning_lines) == 'Player'
        player_score += 1
      elsif detect_winner(board, winning_lines) == 'Computer'
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

# system 'clear'
display_board(board, player_name, computer_name)
puts MESSAGES['thanks'] + "#{computer_name}"
