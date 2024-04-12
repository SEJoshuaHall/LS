# Tic Tac Toe
# Note: you will need to install rainbow gem to run this code: 'gem install rainbow'

require 'rainbow/refinement'
using Rainbow

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'.blue
COMPUTER_MARKER = 'O'.red

WINNING_LINES = [[1, 2, 3],
                [4, 5, 6],
                [7, 8, 9],
                [1, 4, 7],
                [2, 5, 8],
                [3, 6, 9],
                [1, 5, 9],
                [3, 5, 7]]

player_score = 0
computer_score = 0
current_player = 'c' #default

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."

  puts " _________________"
  puts "|1    |2    |3    |"
  puts "|  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  |"
  puts "|     |     |     |"
  puts "|-----+-----+-----|"
  puts "|4    |5    |6    |"
  puts "|  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  |"
  puts "|     |     |     |"
  puts "|-----+-----+-----|"
  puts "|7    |8    |9    |"
  puts "|  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  |"
  puts "|_____|_____|_____|"
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
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's an invalid entry."
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

def set_current_player(select_player)
  puts "Would you like to go first? Enter 'y' or 'n'. Or if you want the computer to choose, enter 'c'."
  user_response = gets.chomp
  if user_response == 'y'
    select_player = 'p'
  elsif user_response == 'n'
    select_player = 'c'
  else
    select_player = ['p', 'c'].sample
  end
end

def place_piece!(board, current_player)
  if current_player == 'c' 
    computer_places_piece!(board)
  else
    player_places_piece!(board)
  end
end

def alternate_player(current_player)
  if current_player == 'c'
    current_player = 'p'
  else
    current_player = 'c'
  end
end

loop do
  board = initialize_board

  current_player = set_current_player(current_player)
  
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  prompt "Score: Computer #{computer_score}, Player #{player_score}!"
  
  if computer_score == 5
    puts "Computer won!"
  elsif player_score == 5
    puts "Player won!"
  end
  break if computer_score == 5 || player_score == 5
  
  prompt "Play again? (y or n)"
  answer = gets.chomp
  
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing!"
