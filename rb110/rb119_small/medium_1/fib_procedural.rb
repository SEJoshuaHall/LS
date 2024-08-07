def fibonacci(int)
  return 1 if int == 1 || int == 2
  two_before, one_before = 1, 1
  (int - 2).times do |num|
    two_before, one_before = one_before, two_before + one_before
  end
  one_before
end

p fibonacci(20) #== 6765
p fibonacci(100) #== 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501