=begin

PROBLEM
take array, multiply all numbers and divide by number of entries, and print to 3 decimals


EXAMPLES
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


DATA
input array
# of entries
result of all multiplied
output all divided by entries


ALGORYTHM



CODE
=end

def show_multiplicative_average(integers)
  count = integers.count.to_f
  total = 1
  integers.map do |i|
    total *=  i
  end
  total = total / count
  '%.3f' % total
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667