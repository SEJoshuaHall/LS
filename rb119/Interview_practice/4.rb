=begin
PROBLEM
take array ints, return array of 2 nums closest in value. If more than two are equal return first

EXAMPLES

DATA
input array
output array

ALG
set result array to first two values
iterate through array by index
  iterate through array by index
  next if idx is same
  get abs diff, and if smaller than result, set result to pair
return pair
=end

def closest_numbers(arr)
  result = [arr[0], arr[1]]
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
      next if idx1 == idx2
      if (result[1] - result [0]).abs > (num1 - num2).abs
        result = [num1, num2]
      end
    end
  end
  result
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]