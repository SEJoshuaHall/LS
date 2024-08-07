=begin
PROBLEM
count the number of pairs

EXAMPLE
Rules
count 4 occurances as 2 pairs, 5 as 2
return 0 if none

DATA
Input: array of ints
Output: int representing number of pairs

ALG
set result to 0
get uniq array values
iterate over uniq counting in input
  divide count by 2 and add to result
return result

=end

def pairs(arr)
  result = 0
  unique = arr.uniq
  unique.each do |num|
    result += arr.count(num) / 2
  end
  result
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3