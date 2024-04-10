def factors(number)
  divisor = number
  factors = []
  if number > 0
    until divisor == 0
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end
  else puts "That is not an integer greater than 0. Please try again."
  end
  factors
end