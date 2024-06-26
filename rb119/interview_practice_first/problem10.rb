=begin
Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as a separate substring.

PROBLEM
Take a string of digits, and find the number of substrings which are even

ALGORITHM
convert to array
set result to 0
check each with index
  if even add index + 1 to result
  end
return result

=end

def even_substrings(str)
  arr = str.chars
  result = 0
  arr.each_with_index do |char, idx|
    if char.to_i.even?
      result += (idx+1)
    end
  end
  result
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12