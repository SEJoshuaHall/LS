# Tic Tac Toe
# Note: you will need to install rainbow gem to run this code: 'gem install rainbow'

require 'rainbow/refinement'
using Rainbow

require 'yaml'
MESSAGES = YAML.load_file('tictactoe_mess.yml')

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'.blue.bright
COMPUTER_MARKER = 'O'.red.bright

WINNING_LINES = [[1, 2, 3],
                [4, 5, 6],
                [7, 8, 9],
                [1, 4, 7],
                [2, 5, 8],
                [3, 6, 9],
                [1, 5, 9],
                [3, 5, 7]]

player_score = 0
player_name = ''
computer_score = 0
computer_name = Rainbow('Serious George').red.bright
whos_first = 'computer' #default
board = {}
board_size = 3 #default
play_again = ''

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, player_name, computer_name)
  system 'clear'
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

def computer_defense_move?(brd)
  WINNING_LINES.any? do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def computer_offense_move?(brd)
  WINNING_LINES.any? do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def computer_places_defense!(brd)
  matches = WINNING_LINES.select do |line|
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

def computer_places_offense!(brd)
  matches = WINNING_LINES.select do |line|
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


def computer_places_piece!(brd)
  if computer_offense_move?(brd)
    computer_places_offense!(brd)
  elsif computer_defense_move?(brd)
    computer_places_defense!(brd)
  elsif brd[5] == ' '
    brd[5] = COMPUTER_MARKER
  else
    computer_places_random!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def intro(computer_name, board_size)
  system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''
  sleep(1)
  puts (MESSAGES['comp_intro_1']) + "#{computer_name}" + (MESSAGES['comp_intro_2'])
  puts ''
  sleep(2)
  puts (MESSAGES['rules_1']) + "#{board_size}" + (MESSAGES['rules_2'])
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

def get_whos_first(whos_first)
  loop do
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
  system 'clear'
  puts Rainbow(MESSAGES['welcome']).cyan.bright.underline
  puts ''

  if whos_first == 'player'
    puts "#{player_name}" + (MESSAGES['announce_who_first'])
  else
    puts "#{computer_name}" + (MESSAGES['announce_who_first'])
  end

  sleep(3)
end

def place_piece!(board, whos_first, computer_name)
  if whos_first == 'computer'
    puts "#{computer_name} " + (MESSAGES['thinking'])
    sleep(rand(2..4))
    computer_places_piece!(board)
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
  loop do
    prompt(MESSAGES['play_again'])
    puts ''
    print ' => '
    answer = gets.chomp.downcase.chars.first
    if answer == 'y' || 'n'
      break
    else
      puts MESSAGES['invalid']
    end
  end
end

loop do
  intro(computer_name, board_size)

  player_name = set_player_name(player_name)

  counter = 0

  loop do
    board = initialize_board

    welcome(player_name)

    whos_first = get_whos_first(whos_first) if counter == 0

    declare_whos_first(whos_first, player_name, computer_name)

    counter += 1

    loop do
      display_board(board, player_name, computer_name)
      place_piece!(board, whos_first, computer_name)
      whos_first = alternate_player(whos_first)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_name, computer_name)

    if someone_won?(board)
      prompt "#{detect_winner(board)}" + (MESSAGES['won'])
      if detect_winner(board) == 'Player'
        player_score += 1
      elsif detect_winner(board) == 'Computer'
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
display_board(board, player_name, computer_name)
puts MESSAGES['thanks'] + "#{computer_name}"
