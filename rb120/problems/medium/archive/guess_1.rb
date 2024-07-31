class GuessingGame
  RANGE = 1..100
  def initialize
    @guesses_remaining = 7
    @guess = 0
    @winning_number = 0
  end

  def play
    obtain_winning_number
    loop do
      obtain_guess
      display_hand_result
      break if win?
      @guesses_remaining -= 1
      break if @guesses_remaining == 0
    end
    display_game_result
  end

  def obtain_winning_number
    @winning_number = RANGE.to_a.sample
  end

  def obtain_guess
    puts "You have #{@guesses_remaining} guesses remaining."
    loop do
      puts "Enter a number between 1 and 100: "
      @guess = gets.chomp.to_i
      break if RANGE.cover?(@guess)
      puts 'Invalid guess. '
    end
  end

  def display_hand_result
    if @guess > @winning_number
      puts 'Your guess is too high.'
    elsif @guess < @winning_number
      puts 'Your guess is too low.'
    else
      puts "That's the number!"
    end
  end

  def win?
    @winning_number == @guess
  end

  def display_game_result
    puts ''
    if win?
      puts 'You won!'
    else
      puts 'You have no more guesses. You lost!'
    end
  end
end

game = GuessingGame.new
game.play
