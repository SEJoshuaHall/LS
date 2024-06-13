=begin
PROBLEM
take an array, recursively break it into pairs of subarrays containing half the elements until only 1 element per array
recombine 2 at a time on each iteration, sorted, and return array

DATA
Input: array
Output: array

ALG
check if array is in order
if not, split lowest levels into two arrays

combine, in order, every 2 lowest level arrays, and repeat until 1 level

=end