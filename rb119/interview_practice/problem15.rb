=begin

Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.

PROBLEM
check all consecutive substrings containing exactly 4 elements for their product and return the greatest

DATA
input string
array of valid sub_arrays -> products
output greatest product

ALGORITHM
split str into array of characters
get all subarrays of 4 consecutive elements
convert the subarrays into integers representing the multiples
return the greatest value

=end

def get_subs(arr)
  subs = []
  arr.each_with_index do |_, idx|
   break if idx == arr.count - 3
    subs << [arr[idx].to_i, arr[idx+1].to_i, arr[idx+2].to_i, arr[idx+3].to_i]
  end
  subs
end

def greatest_product(str)
  arr = str.chars
  sub_arrs = get_subs(arr)
  products = sub_arrs.map do |sub|
    sub.inject(:*)
  end
  products.max
end


p greatest_product('23456') #== 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') #== 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') #== 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') #== 3024 # 9 * 8 * 7 * 6