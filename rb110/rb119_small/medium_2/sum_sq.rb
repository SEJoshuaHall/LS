=begin
PROBLEM
take an integer, compute and return the difference between sum of squares and sum squred

DATA
input: integer
arr_integers
sum_sq
sq_sum
output: integer

ALG
set sq_sum to computation
set sum_sq to computation
return difference
=end
def sum_square_difference(int)
  arr_ints = (1..int).to_a
  sq_sum = arr_ints.inject(:+) ** 2
  sum_sq = arr_ints.map {|i| i ** 2}.inject(:+)
  sq_sum -  sum_sq
end

p sum_square_difference(3) == 22
  #  -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150