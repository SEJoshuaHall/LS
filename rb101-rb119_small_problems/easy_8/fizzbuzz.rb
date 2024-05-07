=begin

PROBLEM
take 2 args, starting and ending integers, and print out all nums from starting to ending except if divisible by 3 print "Fizz", by 5, "Buzz", by both, "FizzBuzz"


EXAMPLES
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

DATA



ALGORYTHM



CODE
=end

def fizzbuzz(int, int2)
  result = ''
  int.upto(int2) do |i|
    if i % 15 == 0
      result << "FizzBuzz, "
    elsif i % 5 == 0
      result << "Buzz, "
    elsif i % 3 == 0
      result << "Fizz, "
    else
      result << "#{i}, "
    end
  end
  result[0..-3]
end

p fizzbuzz(1, 15) == "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"