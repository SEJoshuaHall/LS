=begin
find int that appears odd number of times in input array

EXAMPLES


ALG
set uniq array
iterate over uniq and count in input, and return if odd

=end
def odd_fellow(arr)
  unique = arr.uniq
  unique.each do |num|
    if arr.count(num).odd?
      return num
    end
  end
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0