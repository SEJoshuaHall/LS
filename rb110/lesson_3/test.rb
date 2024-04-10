PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

board = {1 => 'X', 2 => 'X', 3 => '', 4 => '', 5 => 'X', 6 => '', 7 => '', 8 => '', 9 => 'X'}

def computer_places_defense!(brd) 
  matches = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2
  end

  select_match = matches.sample

  if brd[select_match[0]] == ''
    brd[select_match[0]] = COMPUTER_MARKER
  elsif brd[select_match[1]] == ''
    brd[select_match[1]] = COMPUTER_MARKER 
  elsif brd[select_match[2]] == ''
    brd[select_match[2]] = COMPUTER_MARKER
  end

  brd
end

p computer_places_defense!(board)

p board

