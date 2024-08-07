=begin

PROBLEM
merge two array arguments with duplicates removed.


EXAMPLES
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


DATA



ALGORYTHM



CODE
=end

def merge(array_1, array_2)
  result = array_1.dup
  array_2.each { |e| result << e }
  result.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]