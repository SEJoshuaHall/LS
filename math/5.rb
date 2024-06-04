# start = 2520
# loop do
#   status = true
#   1.upto(20) do |num|
#     if start % num != 0
#       status = false
#     end
#   end
#   break if status == true
#   start += 1
#   p start
# end
# p start


# 20 - 2, 2, 5
# 19 - 19
# 18 - 2, 3, 3
# 17 - 17
# 16 - 2, 2, 2, 2
# 15 - 3, 5
# 14 - 2, 7
# 13 - 13
# 12 - 2, 2, 3
# 11 - 11
# 9 - 3, 3
# 7 - 7

num = [2, 2, 2, 2, 3, 3, 5, 7, 11, 13, 17, 19]
p num.inject(:*)