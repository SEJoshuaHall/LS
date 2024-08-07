def fizzbuzz(int1, int2)
  result = []
  int1.upto(int2) do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 3 == 0 
      result << "Fizz"
    elsif num % 5 == 0
      result << "Buzz"
    else
      result << num.to_s
    end
  end
  result.join(", ")
end


p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz