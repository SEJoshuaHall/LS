=begin
PROBLEM
take an array of numbers, and create a new array with the same number of number, each number representing how many other numbers in the coresponding place in the original array are smaller

ALG
get uniq values
create result array
iterate over input array, and count how many uniq values are smaller, concating the count to the result array

=end
def smaller_numbers_than_current(arr)
  uniq_values = arr.uniq
  result = []
  arr.each do |num|
    result << uniq_values.select {|val| val < num}.count
  end
  result
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result