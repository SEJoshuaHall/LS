=begin
PROBLEM
take an array of elements, and split it recursively until in order, and return in order

EXAMPLES

DATA
input array
break down to equal halves recursively if not in order
rebuild otherwise

ALG

return array if sorted, 
  Helper
    check if input is sorted
    iterate over array checking each element with prior to ensure it is greater
otherwise, split and pass recursively, and merge returned values

=end
def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  arr1_idx = 0
  arr2_idx = 0
  result = []
  loop do
    if arr1[arr1_idx] < arr2[arr2_idx]
      result << arr1[arr1_idx]
      arr1_idx += 1
    else
      result << arr2[arr2_idx]
      arr2_idx += 1
    end
    if arr1_idx >= arr1.count
      until arr2_idx >= arr2.count
        result << arr2[arr2_idx]
        arr2_idx += 1
      end
      return result
    elsif arr2_idx >= arr2.count
      until arr1_idx >= arr1.count
        result << arr1[arr1_idx]
        arr1_idx += 1
      end
      return result
    end
  end
end

def sorted?(array)
  array.each_with_index do |e, idx|
    next if idx == 0
    return false if e < array[idx - 1]
  end
  true
end

def merge_sort(array)
  return array if sorted?(array)
  merge(merge_sort(array[0...(array.length/2)]), merge_sort(array[((array.length/2 )..-1)]))
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort([9, 2, 7, 6, 8, 5, 0, 1]) == [0, 1, 2, 5, 6, 7, 8, 9]

p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]