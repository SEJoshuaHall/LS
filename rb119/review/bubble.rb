=begin
PROBLEM
iterate over input array, compare 2 elements at a time, swap if out of order, continue passes until no change

EXAMPLES
DATA
change variable
input: array
output: modified array

ALG
iterate over array
  set change to false
  next if first
  compare with prior
  if not ordered
    swap
    update change to true
  break if change false
=end

def bubble_sort!(array)
  loop do
    change = false
    array.each_with_index do |e, i|
      next if i == 0
      if e < array[i - 1]
        array[i - 1], array[i] = array[i], array[i - 1]
        change = true
      end
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