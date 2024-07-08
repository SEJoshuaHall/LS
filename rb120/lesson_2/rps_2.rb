# frozen_string_literal: true

# Define players and set names
class Player
  VALUES = %w[rock paper scissors lizard spock].freeze
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

# Create human player
class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?

      puts 'Sorry must enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, scissors, lizard, or spock:'
      choice = gets.chomp
      break if Move::VALUES.include? choice

      puts 'Sorry, invalid choice.'
    end

    case choice
    when 'rock'
      self.move = Rock.new
    when 'paper'
      self.move = Paper.new
    when 'scissors'
      self.move = Scissors.new
    when 'lizard'
      self.move = Lizard.new
    when 'spock'
      self.move = Spock.new
    end

  end
end

# Create ai player
class Computer < Player
  def set_name
    self.name = %w[R2D2 HAL Chappie].sample
  end

  def choose
    choice = (Move::VALUES.sample)

    case choice
    when 'rock'
      self.move = Rock.new
    when 'paper'
      self.move = Paper.new
    when 'scissors'
      self.move = Scissors.new
    when 'lizard'
      self.move = Lizard.new
    when 'spock'
      self.move = Spock.new
    end
  end
end

class Scissors
  def to_s
    'scissors'
  end
end

class Rock
  def to_s
    'rock'
  end
end

class Paper
  def to_s
    'paper'
  end
end

class Lizard
  def to_s
    'lizard'
  end
end

class Spock
  def to_s
    'spock'
  end
end

# Define moves and who won
class Move
  def initialize(value)
    @value = value
  end

  def >(other)
    (rock && (other.scissors || other.lizard)) ||
      (paper && (other.rock || other.spock)) ||
      (scissors && (other.pape? || other.lizard)) ||
      (spock && (other.rock || other.paper)) ||
      (lizard && (other.spock || other.paper))
  end

  def <(other)
    (rock && (other.paper || other.spock)) ||
      (paper? && (other.lizard? || other.scissors?)) ||
      (scissors? && (other.spock? || other.rock?)) ||
      (spock? && (other.scissors? || other.lizard?)) ||
      (lizard? && (other.rock? || other.scissors?))
  end

  def to_s
    @value
  end
end

# Main game play logic
class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = []
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors, Lizard, Spock!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won this round!"
      human.score += 1
      @history << ["#{human.name} chose #{human.move}", "#{computer.name} chose #{computer.move}", "#{human.name} won this round!"]
    elsif human.move < computer.move
      puts "#{computer.name} won this round!"
      computer.score += 1
      @history << ["#{human.name} chose #{human.move}", "#{computer.name} chose #{computer.move}", "#{computer.name} won this round!"]
    else
      puts "It's a tie this round!"
      @history << ["#{human.name} chose #{human.move}", "#{computer.name} chose #{computer.move}", "It's a tie this round!"]
    end
    puts "The current score is:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def winner?
    human.score >= 1 || computer.score >= 1
  end

  def display_game_winner
    if human.score >= 3
      puts "#{human.name} won the game!"
    else
      puts "#{computer.name} won the game!"
    end
    human.score = 0
    computer.score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include? answer.downcase

      puts 'Sorry, must be y or n.'
    end

    return true if answer.downcase == 'y'
    false
  end

  def display_history
    def initialize
      @round = 0
    end
    puts "Here is the history of this game."
    # @history.each do |game_sub_array|
    #   puts "On round #{@round}, #{game_sub_array}"
    #   @round += 1
    # end
  end

  def play
    display_welcome_message

    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_round_winner
        break if winner?
      end
      display_game_winner
      break unless play_again?
    end
    display_history
    display_goodbye_message
  end
end

RPSGame.new.play
