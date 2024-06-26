# frozen_string_literal: true

# NOTE: This program was provided by Launch School for teaching purposes.
# Game Orchestration Engine
class Move
  VALUES = %w[rock paper scissors].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other)
    rock? && other.scissors? ||
      paper? && other.rock? ||
      scissors? && other.paper?

    false
  end

  def <(other)
    rock? && other.paper? ||
      paper? && other.scissor? ||
      scissors? && other.rock?

    false
  end

  def to_s
    @value
  end
end

# Method for defining the players
class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

# Inherits from Player and defines human
class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?

      puts 'Sorry, must enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, or scissors:'
      choice = gets.chomp
      break if Move::VALUES.include? choice

      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end
end

# Inherits from Player and defines Computer
class Computer < Player
  def set_name
    self.name = %w[R2D2 Hal Chappie Sonny].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Main logic of game.
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Good bye!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include? answer.downcase

      puts 'Sorry, must be y or n.'
    end

    return true if answer == 'y'

    false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
