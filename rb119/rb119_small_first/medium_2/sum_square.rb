=begin

PROBLEM
take integer(n) and computer difference between (square of the sum of the first n positive integers) and (sum of the squares of the first n positive integers)


EXAMPLES
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150


DATA



ALGORYTHM



CODE
=end

def sum_square_difference(int)
  sum_square = *(1..int).inject(0) {|result, element| result + element}**2
  square_sum = *(1..int).inject(0) {|result, element| result + (element**2)}
  sum_square[0] - square_sum[0]
end


p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150