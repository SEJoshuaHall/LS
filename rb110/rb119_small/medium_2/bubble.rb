=begin
PROBLEM
take an array, iterate over it, sorting every pair, and break when no changes through an iteration

DATA
iterate over array at index 1 to length
  change switch to false
  compare with prior index,
    if out of order
      swap
      set switch
  if switch false, break
return array
=end
def sort_iter!(array, mod)
  array.each_with_index do |element, index|
    next if index == 0
    if element < array[index - 1]
      prior = array[index - 1]
      array[index - 1] = element
      array[index] = prior 
      mod = true
    end
  end
  [array, mod]
end


def bubble_sort!(array)
  loop do
    mod = false
    result = sort_iter!(array, mod)
    array = result[0]
    mod = result[1]
    break if mod == false
  end
  array
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