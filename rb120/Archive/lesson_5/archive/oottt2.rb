class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :WINNING_LINES

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def [](num)
    @squares[num]
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame

  attr_reader :board, :human, :computer, :human_name, :computer_name, :human_marker, :computer_marker
  attr_accessor :winning_score, :human_score, :computer_score, :defensive_play, :offensive_play, :winning_play

  def initialize
    @board = Board.new
    @current_marker = nil
    @winning_score = 5
    @human_score = 0
    @computer_score = 0
    @computer_name = ["HAL", "Deep Thought", "Prime Intellect", "F.R.I.D.A.Y.", "NOVAC", "Alfie", "D.A.R.Y.L.", "The Matrix", ].sample
    @human_name = "Homo Sapien"
    @defensive_play = 0
    @offensive_play = 0
    @winning_play = 0
  end

  def play
    clear
    display_welcome_message
    get_human_name
    get_player_markers_initialize_players
    display_challenge
    set_winning_score
    get_whos_first
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      loop do
        display_board
        player_move
        display_result
        reset
        break if someone_won_tournament?
      end
      display_tournament_winner
      reset_tournament
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def get_player_markers_initialize_players
    @human_marker = nil
    loop do
      puts "Please choose a marker, a single alphabetic character: "
      @human_marker = gets.chomp
      break if ('A'..'Z').include?(@human_marker) || ('a'..'z').include?(@human_marker)
      puts "Invalid entry, please try again."
    end

    if @human_marker == 'o'
      @computer_marker = 'x'
    elsif @human_marker == 'O'
      @computer_marker = 'X'
    elsif @human_marker == 'x'
      @computer_marker = 'o'
    elsif @human_marker == 'X'
      @computer_marker = 'O'
    elsif @human_marker == @human_marker.upcase
      computer_marker_options = ('A'..'Z').to_a
      computer_marker_options.delete(@human_marker)
      @computer_marker = computer_marker_options.sample
    else
      computer_marker_options = ('a'..'z').to_a
      computer_marker_options.delete(@human_marker)
      @computer_marker = computer_marker_options.sample
    end    
    @human = Player.new(human_marker)
    @computer = Player.new(computer_marker)
  end

  def get_whos_first
    first = nil
    human_choose = nil
    loop do
      puts "Would you like to choose who will go first?"
      human_choose = gets.chomp.downcase
      break if %w(y n).include?(human_choose)
      "Invalid entry, please try again."
    end

    if human_choose == 'y'
      loop do
        puts "Would you like to go first? (y/n) "
        first = gets.chomp.downcase
        break if %w(y n).include?(first)
        "Invalid entry, please try again."
      end
      first == 'y' ? @current_marker = human_marker : @current_marker = computer_marker
    else
      @current_marker = [human_marker, computer_marker].sample
    end

    puts  @current_marker == human_marker ? "#{human_name} will go first!" : "#{computer_name} will go first!"
  end

  def someone_won_tournament?
    human_score == winning_score || computer_score == winning_score
  end  

  def display_tournament_winner
    puts human_score == winning_score ? "#{human_name} won the tournament!" : "#{computer_name} won the tournament!"
  end

  def reset_tournament
    @human_score = 0
    @computer_score = 0
  end

  def get_human_name
    name = ''
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name == ''
      puts "Invalid entry, plese try again."
    end  
    @human_name = name
  end  
  
  def display_challenge
    clear
    puts ''
    puts "Hi, #{@human_name}. My name is #{@computer_name}, and I challenge you to a tournament of Tic Tac Toe!"
    puts ''
  end  

  def get_winning_score
    number = 5
    loop do
      puts "How many rounds of Tic Tac Toe must a player win to win the tournament?"
      puts "Please choose a number between 2 and 5: "
      number = gets.chomp.to_i
      break if (2..5).include?(number)
      clear
      puts 'Invalid entry, please try again.'
    end  
    number
  end  

  def set_winning_score
    @winning_score = get_winning_score
    clear
    puts ''
    puts "To win the tournament, a player must win #{@winning_score} games!"
    sleep 2
  end  
  
  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human_marker
  end

  def display_board
    puts "#{human_name} is a #{human.marker}. #{computer_name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
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

  def human_moves
    puts "Choose a square: #{joinor(board.unmarked_keys)} "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    if winning_move?
      winning_move
    elsif defense_move?
      defense_move
    elsif offense_move?
      offense_move
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def winning_move?
    Board::WINNING_LINES.each do |line|
      count_human = 0
      count_computer = 0
      line.each do |square|
        if board[square].marker == human_marker 
          count_human += 1
        elsif board[square].marker == computer_marker
          count_computer += 1
        elsif board[square].marker == ' '
          @winning_play = square
        end
      end
      return true if count_human == 0 && count_computer == 2
    end    
    false
  end

  def winning_move
    board[@winning_play] = computer.marker
  end

  def defense_move?
    Board::WINNING_LINES.each do |line|
      count_human = 0
      count_computer = 0
      line.each do |square|
        if board[square].marker == human_marker 
          count_human += 1
        elsif board[square].marker == computer_marker
          count_computer += 1
        elsif board[square].marker == ' '
          @defensive_play = square
        end
      end
      return true if count_human == 2 && count_computer == 0
    end
    false
  end

  def defense_move
    board[@defensive_play] = computer.marker
  end

  def offense_move?
    if board[5].marker == ' '
      @offensive_play = 5
      return true
    end
    Board::WINNING_LINES.each do |line|
      count_human = 0
      count_computer = 0
      line.each do |square|
        if board[square].marker == human_marker 
          count_human += 1
        elsif board[square].marker == computer_marker
          count_computer += 1
        elsif board[square].marker == ' '
          @offensive_play = square
        end
      end
      return true if count_human == 0 && count_computer == 1
    end    
    false
  end

  def offense_move
    board[@offensive_play] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer_marker
    else
      computer_moves
      @current_marker = human_marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human_name} won!"
      @human_score += 1
    when computer.marker
      puts "#{computer_name} won!"
      @computer_score += 1
    else
      puts "It's a tie!"
    end

    puts "#{human_name}'s score is #{@human_score}, and #{computer_name}'s score is #{@computer_score}. The first player to win #{@winning_score} games wins the tournament!"
    sleep 2
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play