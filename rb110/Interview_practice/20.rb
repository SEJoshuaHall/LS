=begin
PROBLEM

ALG
get unique
iterate over input and return count = 1
=end
def what_is_different(arr)
  unique = arr.uniq
  unique.each do |num|
    return num if arr.count(num) == 1
  end
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3