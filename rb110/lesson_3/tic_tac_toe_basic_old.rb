=begin
Tic Tac Toe

1. Dislay the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner not board is full, go to #2.
8. Play again?
9. If yes, go to #1.
10. Good bye!

=end
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

player_score = 0
computer_score = 0
computer_next = 'n' # default

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |     "
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

=begin
Note: assignment asks that computer detect 2 in a row for defensive or offensive next move, I made it better with 2 out of 3 in a winning scenario. I also randomized the order of the array in each method so that if there are two or more possible winning scenarios, it does not always choose the first in the original WINNING_LINES array. In real life I would ask first to see if this would be considered an improvement before implementing.
=end

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

def set_computer_next(computer_first)
  puts "Would you like to go first? Enter 'y' or 'n'. Or if you want the computer to choose, enter 'c'."
  user_response = gets.chomp
  if user_response == 'n'
    'y'
  elsif user_response == 'c'
    ['y', 'n'].sample
  else
    computer_first
  end
end

loop do
  board = initialize_board

  computer_next = set_computer_next(computer_next)
  p computer_next
  loop do
    display_board(board)

    if computer_next == 'y'
      computer_places_piece!(board)
      computer_next = 'n'
    else
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
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
