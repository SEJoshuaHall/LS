working_sq_sum = 0
working_sum_sq = 0
sq_sum = (1.upto(100) { |num| working_sum_sq += num})#still need to square
sum_sq = 1.upto(100) { |num| working_sq_sum += (num ** 2)}
p (working_sum_sq ** 2) - working_sq_sum