=begin

DESCRIPTION
There are two players, one the computer, the other human. The board has squares and is x across and x down. Players take turns placing their pieces on the board. When one player completes an unbroken string across the board, that player wins.

Additional
varying size and victory length
greetings
play again
tournament
various ai characters with logic
additional players
colors for players
opening graphics
closing graphics
extract messaging
error logging
dramatic pauses

Nouns
Computer, Human, board, markers

Verbs
Turn, mark, win/lose, draw board

SPIKE
=end 

#Must have the Rainbow Gem (gem install rainbow)

require 'rainbow'
require 'yaml'

MESSAGES = YAML.load(File.read("TicTacToe.yml"))

module TTTFunctions
  def title
    clearscreen
    puts ''
    puts '      ' + Rainbow("Tic Tac Toe!").underline.bright
    puts ''
  end
  
  def clearscreen
    puts "\e[H\e[2J"
  end
  
  def prompt
    print "  => "
  end
end

class Player
  def initialize(name, color, marker, type)
    @name = name
    @marker = Rainbow(marker).color
    @type = type
  end

  def play

  end
end

class Board
  include TTTFunctions

  attr_reader :size

  def initialize(size=3, num_to_win=3)
    @size = size
    @num_to_win = num_to_win
    @board = initialize_board
    @whos_next = nil
  end

  def initialize_board
    board = []
    @size.times { board << Array.new(@size) }
    board.each do |array|
      array.map! do |space|
        space = ' '
      end
    end
  end

  def display_board
    title
    board = @board.dup.flatten
    top_line = '╔' + ('═══════╦' * (@size - 1)) + '═══════╗'
    dividing_line = '╠' + ('═══════╬' * (@size - 1)) + '═══════╣'
    bottom_line = '╚' + ('═══════╩' * (@size - 1)) + '═══════╝'
    empty_line = '║' + ('       ║' * (@size - 1)) + '       ║'
    character_line_start = '║'
    puts top_line
   
    (@size - 1).times do
      puts empty_line
      print character_line_start
      @size.times {|_| print "   #{board.shift}   ║"}
      puts ''
      puts empty_line
      puts dividing_line
    end

    puts empty_line
    print character_line_start
    @size.times {|_| print "   #{board.shift}   ║"}
    puts ''
    puts empty_line
    puts bottom_line
    puts ''
  end

end

class PlayGame
  include TTTFunctions

  @@colors = %w(black red green yellow blue magenta cyan white aqua silver aliceblue indianred)
  def play
    greeting
      #welcome, rules, game_size
    setup
      #human, opponent, piece, color, who_first
    turns
      #take turns until game over
    winner
      #determine and announce
  end

  def greeting

end

board = Board.new
board.display_board