=begin

PROBLEM
take an array, loop over the array changing the first two elements which are out of order, and repeat until not changes


EXAMPLES
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


DATA
input: array
output: same array


ALGORYTHM
loop
take first pair of array elements and check if out of order
if so sort and modify array accordingly and next
else check next pair until last
  if no change, break and return array


CODE
=end

def bubble_sort!(array)
  element_count = array.count
  loop do
    change = false
    counter = 1
    loop do
      if array[counter - 1] > array[counter]
        array[counter - 1], array[counter] = array[counter], array[counter - 1]
        change = true
      end
      counter += 1
      break if counter == element_count
    end
    break if change == false
  end
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)