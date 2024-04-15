INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/AbcSize

def joinor(array, separator = ", ", last_separator = "or")
  return "#{array[0]} #{last_separator} #{array[1]}" if array.length == 2
  return array[0].to_s if array.length == 1
  return '' if array.empty?
  last_element = array.pop
  new_string = array.join(separator)
  "#{new_string}#{separator}#{last_separator} #{last_element}"
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

def return_at_risk_square(brd, marker)
  square = []
  WINNING_LINES.each do |line|
    marker_array = brd.values_at(*line)
    if marker_array.count(marker) == 2 && marker_array.include?(' ')
      square = line.select { |num| brd[num] == ' ' }
    end
  end
  square.first
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}.")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  offense_square = return_at_risk_square(brd, COMPUTER_MARKER)
  defense_square = return_at_risk_square(brd, PLAYER_MARKER)
  if !(offense_square.nil?)
    brd[offense_square] = COMPUTER_MARKER
  elsif !(defense_square.nil?)
    brd[defense_square] = COMPUTER_MARKER
  elsif brd[5] == ' '
    brd[5] = COMPUTER_MARKER
  else
    brd[empty_squares(brd).sample] = COMPUTER_MARKER
  end
end

def main_game_moves!(brd, current_player)
  counter = 0
  loop do
    display_board(brd) unless current_player == 'Computer' && counter == 0
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    counter += 1
    break if someone_won?(brd) || board_full?(brd)
  end
end

def place_piece!(brd, player)
  case player
  when 'Player'
    player_places_piece!(brd)
  when 'Computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  return 'Player' if current_player == 'Computer'
  'Computer'
end

def print_winner_and_scores(winner, player, computer)
  if winner == 'Player' || winner == 'Computer'
    prompt "#{winner} won this round!"
  else
    prompt "It's a tie!"
  end
  prompt "Your score is #{player}. Computer's score is #{computer}."
end

system 'clear'
prompt 'Hello! Welcome to Tic Tac Toe.'

loop do
  player_score = 0
  computer_score = 0
  board = initialize_board
  first_player = ''
  prompt 'Who should pick the first player? Enter C for Computer, P for Player.'
  loop do
    answer = gets.chomp.downcase
    if answer == 'c'
      first_player = ['Player', 'Computer'].sample
      break
    elsif answer == 'p'
      prompt 'OK, who should move first? Enter C for Computer or P for Player.'
      answer = gets.chomp.downcase
      case answer
      when 'c'
        first_player = 'Computer'
      when 'p'
        first_player = 'Player'
      end
      break
    else
      prompt 'Sorry, that is not a valid choice. Please enter C or P.'
    end
  end
  prompt "#{first_player} will move first."
  prompt "You are #{PLAYER_MARKER}. The Computer is #{COMPUTER_MARKER}."
  prompt 'The board is numbered from left to right and top to bottom.'
  loop do
    current_player = first_player
    main_game_moves!(board, current_player)
    display_board(board)
    if someone_won?(board)
      if detect_winner(board) == 'Player'
        player_score += 1
      else
        computer_score += 1
      end
    end
    print_winner_and_scores(detect_winner(board), player_score, computer_score)
    break if player_score == 5 || computer_score == 5
    board = initialize_board
  end
  prompt "#{detect_winner(board)} won the entire game!"
  prompt "Play again? Enter Y or N."
  answer = gets.chomp
  loop do
    break if answer.downcase == 'n' || answer.downcase == 'y'
    prompt 'Sorry, invalid entry. Enter Y to play again or N to stop.'
    answer = gets.chomp
  end
  break if answer.downcase.start_with?('n')
end
prompt 'Thanks for playing Tic Tac Toe. Good-bye!'