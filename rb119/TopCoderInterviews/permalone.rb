=begin
Find the Symmetric Difference

---

The mathematical term symmetric difference (`△` or `⊕`) of two sets is the set of elements which are in either of the two sets but not in both. For example, for sets `A = {1, 2, 3}` and `B = {2, 3, 4}`, `A △ B = {1, 4}`.

Symmetric difference is a binary operation, which means it operates on only two elements. So to evaluate an expression involving symmetric differences among _three_ elements (`A △ B △ C`), you must complete one operation at a time. Thus, for sets `A` and `B` above, and `C = {2, 3}`, `A △ B △ C = (A △ B) △ C = {1, 4} △ {2, 3} = {1, 2, 3, 4}`.

---

Create a function that takes two or more arrays and returns an array of their symmetric difference. The returned array must contain only unique values (_no duplicates_).

=end

=begin

=== PROBLEM ===

Write a method that returns the symmetric difference of 2 or more input arrays

Rules:
  - symmetric difference: unique values that are in either input but not all
  - returned array must be unique values

=== EXAMPLES ===

sym([1, 2, 5], [2, 3, 5], [3, 4, 5]) == [1, 4, 5]
  [1, 2, 5]△[2, 3, 5] --> [1, 3]
  [1, 3]△[3, 4, 5] --> [1, 4, 5] 

=== DATA ===

input: any number of arrays of integers that need to be compared
intermediate:
  - arrays
  - comparison (what elements are shared)
  - recursion
output: an array of unique integers that are the symmetric diffence of the input arrays

=== ALGORITHM ===

INITIALIZE `result` to reference an empty array
FIND the unique integers in the first array
  - Iterate over arr1 with #each
  - If current element is not included in arr2, then add to result
FIND the unique integers in the second array
  - Iterate over arr2 with #each
  - If current element is not included in arr1, then add to result
REPEATE with `result` until there are no more input arrays 
  - Update arr1 to `result`

=end

# def sym(*arr_s)
#   arrs = [*arr_s]
#   arr1 = arrs.shift
#   result = []

#   until arrs.empty?
#     arr2 = arrs.shift
    
#     arr1.each do |num|
#       result << num if !arr2.include?(num)
#     end

#     arr2.each do |num|
#       result << num if !arr1.include?(num)
#     end
    
#     arr1 = result
#     result = []
#   end

#   arr1.sort.uniq
# end

# ## Tests
# p sym([1, 2, 3], [5, 2, 1, 4]) == [3, 4, 5]
# p sym([1, 2, 3, 3], [5, 2, 1, 4]) == [3, 4, 5]
# p sym([1, 2, 3], [5, 2, 1, 4, 5]) == [3, 4, 5]
# p sym([1, 2, 5], [2, 3, 5], [3, 4, 5]) == [1, 4, 5]
# p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]) == [2, 3, 4, 6, 7]
# p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]) == [1, 2, 4, 5, 6, 7, 8, 9]


------------------------------------------------------
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



# def sym(*arr_s)
#   arrs = [*arr_s]
#   arr1 = arrs.shift
#   result = []
  
#   until arrs.empty?
#     arr2 = arrs.shift

#     arr1.each do |num|
#       result << num if !arr2.include?(num)
#     end

#     arr2.each do |num|
#       result << num if !arr1.include?(num)
#     end

#     arr1 = result
#   end

#   result.sort
# end

# ## Tests
# p sym([1, 2, 3], [5, 2, 1, 4]) == [3, 4, 5]
# p sym([1, 2, 3, 3], [5, 2, 1, 4]) == [3, 4, 5]
# p sym([1, 2, 3], [5, 2, 1, 4, 5]) == [3, 4, 5]
# p sym([1, 2, 5], [2, 3, 5], [3, 4, 5]) == [1, 4, 5]
# p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]) == [2, 3, 4, 6, 7]
# p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]) == [1, 2, 4, 5, 6, 7, 8, 9]


-----------------------------------------------------




=begin
No Repeats Please

---

Return the number of total permutations of the provided string that don't have repeated consecutive letters. Assume that all characters in the provided string are each unique.

For example, `aab` should return 2 because it has 6 total permutations (`aab`, `aab`, `aba`, `aba`, `baa`, `baa`), but only 2 of them (`aba` and `aba`) don't have the same letter (in this case `a`) repeating.


PROBLEM
find every combination of given letters
select ones without 2 of same letters in a row
find count of all letters for which there are more than 1 - array
count qualifying strings
multiply count by each number in array and return the result

EXAMPLES
if length is 1, return 1
elsif only 1 character return 0

DATA
input string
array of all possible combinations
array of qualifying combinaations
array of letter counts greater than 1
output integer

ALG
if length is 1, return 1
elsif only 1 character return 0
else
set combos
      HELPER get combos
        get all possible combinations
        set array to each character
        loop 
          concat str to combos
          swap final 2
          concat
          swap -3, -2
          concat
          swap -2 -1
          concat
          repeat for length of string
set qualifying
HELPER
find qualifying
  loop over combos
    if no 2 consecutive are the same concat
      switch to true
      iterate over chars with index
        next if first
        if any are the same as previous
          switch = false
    if switch true concat
set multipliers array
HELPER
  get uniq chars from input
  iterate
    if count > 1
      concat count to multipliers array
take count of qualifying, multiply by each multiplier and return the result

=end
def get_combos(str)
  combos = []
  arr = str.chars
  counter = str.length
  current = str.length
  combos << arr.join
  (1..counter).each do |start|
    
  end
  combos
end

def find_qualifying(combos)

end

def permAlone(str)
  
end

p permAlone("aab") == 2
p permAlone("aaa") == 0
p permAlone("aabb") == 8
p permAlone("abcdefa") = 3600
p permAlone("abfdefa") == 2640
p permAlone("zzzzzzzz") == 0
p permAlone("a") == 1
p permAlone("aaab") == 0
p permAlone("aaabb") == 12

