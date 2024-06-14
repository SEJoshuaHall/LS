# =begin
# Find the Symmetric Difference

# ---

# The mathematical term symmetric difference (`△` or `⊕`) of two sets is the set of elements which are in either of the two sets but not in both. For example, for sets `A = {1, 2, 3}` and `B = {2, 3, 4}`, `A △ B = {1, 4}`.

# Symmetric difference is a binary operation, which means it operates on only two elements. So to evaluate an expression involving symmetric differences among _three_ elements (`A △ B △ C`), you must complete one operation at a time. Thus, for sets `A` and `B` above, and `C = {2, 3}`, `A △ B △ C = (A △ B) △ C = {1, 4} △ {2, 3} = {1, 2, 3, 4}`.

# ---

# Create a function that takes two or more arrays and returns an array of their symmetric difference. The returned array must contain only unique values (_no duplicates_).

# PROBLEM
# Find the difference between two input arrays, then the difference between that result and the next input array, until all input arrays have been compared. Return the resulting array.

# EXAMPLES
# Verified my understanding.
# Rules:
# Binary operation
# Sort final product
# Only unique numbers in return for each binary operation

# DATA
# Input: set of arrays
# Output: result array

# ALGORITHM
# write a method which takes 2 or more arrays as arguments called sym
# set array 1 to arr1, and array 2 to arr2
# set current index to 1
# loop
#   get difference between arr1 and arr2 and set to arr1
#   break if current index is length of input array - 1
#   increment current index
# return arr1

# =end

# def sym(*args)
#   arr1, arr2 = args[0], args[1]
#   current_index = 1
#   loop do
#     arr1 = ((arr1 - arr2) + (arr2 - arr1)).uniq.sort
#     current_index += 1
#     break if current_index >= args.count
#     arr2 = args[current_index]
#   end
#   arr1
# end



# p sym([1, 2, 3], [5, 2, 1, 4]) == [3, 4, 5]
# p sym([1, 2, 3, 3], [5, 2, 1, 4]) == [3, 4, 5]
# p sym([1, 2, 3], [5, 2, 1, 4, 5]) == [3, 4, 5]
# p sym([1, 2, 5], [2, 3, 5], [3, 4, 5]) == [1, 4, 5]
# p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]) == [2, 3, 4, 6, 7]
# p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]) == [1, 2, 4, 5, 6, 7, 8, 9]



def sym(*arr_s)
  arrs = [*arr_s]
  arr1 = arrs.shift
  result = []
  
  until arrs.empty?
    arr2 = arrs.shift

    arr1.each do |num|
      result << num if !arr2.include?(num)
    end

    arr2.each do |num|
      result << num if !arr1.include?(num)
    end

    arr1 = result
  end

  result.sort
end

## Tests
p sym([1, 2, 3], [5, 2, 1, 4]) == [3, 4, 5]
p sym([1, 2, 3, 3], [5, 2, 1, 4]) == [3, 4, 5]
p sym([1, 2, 3], [5, 2, 1, 4, 5]) == [3, 4, 5]
p sym([1, 2, 5], [2, 3, 5], [3, 4, 5]) == [1, 4, 5]
p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]) == [2, 3, 4, 6, 7]
p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]) == [1, 2, 4, 5, 6, 7, 8, 9]