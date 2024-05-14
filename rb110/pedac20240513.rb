# Implement function that finds all fibonacci slices in a given array of integers. A Fibonacci slice is a sequence where every number after the first two is the sum of the two preceding ones. The minimum length is 3. -- Joshua

# Test cases
# puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect # [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
# puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
# puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
# puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
# puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []

=begin

PROBLEM
Take an array, find all fib. slices in that array. Confirmed from examples: each number in the array can start a sequence. All numbers in the sequence are sequential. 


EXAMPLES
puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect # [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []



DATA



ALGORYTHM
take all possible slices from array and place into array of arrays
loop over all subarrays to test if all numbers in them fit in a sequence of fib. numbers. 
  Find largest number in sub arrays
  Generate fib. sequence to that largest number in comparitor array.
  Test each subarray to see if it is contained in the comparitor array
  return only subarrays which are


CODE
# =end

def gen_fib_sequence(number)
  fib_seq = [1, 1]
  loop do 
    fib_seq << fib_seq[-2] + fib_seq[-1]
    break if fib_seq[-1] > number
  end
  fib_seq
end

def get_array_slices(array)
  length = array.length
  count = 1
  array_slices = []
  ending_num = length
  loop do
    array.each do
      array[count]
      array_slices << array.slice(count..-1)
      count += 1
      break if count > length
    end
    break if ending_num == 1
    ending_num -= 1
    count = 1
   end
  array_slices
end

def find_fibonacci_slices(array)
  greatest_num = array.max
  fib_sequence = gen_fib_sequence(greatest_num)
  array_slices = get_array_slices(array)
  result = []
  array_slices.each do |sub_array|
    if fib_sequence.include?(sub_array)
      result << sub_array
    end
  end
  result
end


puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect # [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
# puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
# puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
# puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
# puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []
=end