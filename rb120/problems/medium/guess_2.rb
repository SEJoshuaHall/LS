class GuessingGame
  def initialize(low, high)
    @low = low
    @high = high
    @guesses_remaining = Math.log2(high - low).to_i + 1
  end
  
  def play
    @winning_number = (@low..@high).to_a.sample
    @guess = 0
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
      puts "Enter a number between #{@low} and #{@high}: "
      @guess = gets.chomp.to_i
      break if (@low..@high).cover?(@guess)
      print "Invalid guess. "
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
