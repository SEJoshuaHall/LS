=begin
Given an array `arr`, find element pairs whose sum equal the second argument `arg` and return the sum of their indices.

You may use multiple pairs that have the same numeric elements but different indices. Each pair should use the lowest possible available indices. Once an element has been used it cannot be reused to pair with another element. For instance, `pairwise([1, 1, 2], 3)` creates a pair `[2, 1]` using the 1 at index 0 rather than the 1 at index 1, because 0+2 < 1+2.

For example `pairwise([7, 9, 11, 13, 15], 20)` returns `6`. The pairs that sum to 20 are `[7, 13]` and `[9, 11]`. We can then write out the array with their indices and values.

|Index|0|1|2|3|4|
|---|---|---|---|---|---|
|Value|7|9|11|13|15|

Below we'll take their corresponding indices and add them.

7 + 13 = 20 → Indices 0 + 3 = 3  
9 + 11 = 20 → Indices 1 + 2 = 3  
3 + 3 = 6 → Return `6`

PROBLEM
1. find pairs whose sums == second arg
  must be uniq elements
  find the 1st index num for each element in pairs
  sum their indices and return

DATA
Input(array, int)
output integer

ALG
dup input array
set var pairs
iterate over dup input array
  iterate over remaining
    if sum == input int
    concat pair to pairs
    replace with '!'
map and sort all pairs subs 
select unique and flatten pairs
set var selected []
iterate over pairs
  iterate over input array with index
  if match and selected does not include index
    concat index to selected
sum selected and return
=end
#### Tests
def get_pairs(array, int)
  arr = array.dup
  pairs = []
  selected_indices = []
  arr.each_with_index do |num1, current_idx|
    next if selected_indices.include?(current_idx)
    ((current_idx + 1)..(array.length - 1)).each do |comp_idx|
      if selected_indices.include?(comp_idx) || current_idx == comp_idx
        p 'test'
        next
      end
      if num1 + arr[comp_idx] == int
        pairs << [num1, arr[comp_idx]]
        selected_indices << current_idx
        selected_indices << comp_idx
      end
    end
  end
  [pairs, selected_indices]
end

def pairwise(array, int)
  return 0 if array.empty?
  pairs, selected_indices = def get_pairs(array, int)[0], def get_pairs(array, int)[1]

  # pairs.map! {|sub| sub.sort}
  # pairs = pairs.uniq.flatten
  # selected_indices = []
  # arr = array.dup
  # pairs.each do |num1|
  #   arr.each_with_index do |num2, idx|
  #     if num1 == num2 && selected_indices.none?(idx)
  #       selected_indices << idx
  #       break
  #     end
  #   end
  # end
  # selected_indices.inject(:+)
end

 pairwise([1, 2, 3, 3, 4, 4, 5, 6], 7)

# p pairwise([1, 4, 2, 3, 0, 5], 7) == 11
# p pairwise([1, 3, 2, 4], 4) == 1
# p pairwise([1, 1, 1], 2) == 1
# p pairwise([0, 0, 0, 0, 1, 1], 1) == 10
# p pairwise([], 100) == 0