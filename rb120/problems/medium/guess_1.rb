class GuessingGame
  def initialize
    @winning_number = (1..100).to_a.sample
    @guesses_remaining = 7
    @guess = 0
  end

  def play
    until @guesses_remaining == 0 do
      get_guess
      evaluate_guess
      break if won?
      @guesses_remaining -=1
    end
    end_game
  end

  def end_game
    puts ''
    if won? then puts 'You won!'
    else puts 'You have no more guesses. You lost!'
    end
  end

  def won?
    @winning_number == @guess
  end

  def evaluate_guess
    case 
    when @guess > @winning_number then puts "Your guess is too high."
    when @guess < @winning_number then puts "Your guess is too low."
    else puts "That's the number!"
    end
  end
    
  def get_guess
    loop do
      puts "Enter a number between 1 and 100: "
      @guess = gets.chomp.to_i
      break if (1..100).cover?(@guess)
      print "Invalid guess. "
    end
  end
end

game = GuessingGame.new
game.play
