=begin

Given a collection of integers, write a method to return a new collection of every unique contiguous subarray in that collection with an even sum. The returned subarrays can be in any order.

  

even_subs([1, 1, 1, 1, 1]).sort == [[1, 1], [1, 1, 1, 1]]

even_subs([1, 2, 3, 4, 5]).sort == [[1, 2, 3], [1, 2, 3, 4], [2], [2, 3, 4, 5], [3, 4, 5], [4]]

even_subs([88, 54, 67, 56, 36]).sort == [[36], [54], [56], [56, 36], [88], [88, 54]]

=end

def even_subs(arr)
  working_arr = []
  final_array = []
  loop do
    