# def multisum(int)
#   result = 0
#   (1..int).each do |i|
#     if i % 3 == 0 || i % 5 == 0
#       result += i
#     end
#   end
#   result
# end

def multisum(int)
  (1..int).select {|i| i % 3 == 0 || i % 5 == 0}.inject(:+)
end

p multisum(1000) == 234168
p multisum(10) == 33
p multisum(3) == 3
p multisum(5) == 8